//
//  FavoriteGifPlayer.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit
import SwiftyGif    //FIXME: Don't care for this framework

//FIXME: Refactor with GifPlayer!
class FavoriteGifPlayer: UIViewController
{
    var favoriteGif: FavoriteGif
    let gifPlayer: UIImageView
    let heartIcon: HeartIcon //FIXME: Rename
    let favorites: FavoriteGifs
    
    init(bounds: CGRect, favoriteGif: FavoriteGif, favorites: FavoriteGifs) {
        self.favoriteGif = favoriteGif
        self.gifPlayer = UIImageView(frame: bounds)
        self.heartIcon = HeartIcon(bounds: bounds)
        self.favorites = favorites
        super.init(nibName: nil, bundle: nil)
        gifPlayer.delegate = self
        let doubleTap = DoubleTap(target: self, action: #selector(doubleTapped)) //FIXME: Hidden Dependency
        view.addGestureRecognizer(doubleTap)
        view.backgroundColor = .lightGray
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGifPlayer()
        view.addSubview(heartIcon)
    }
    
    func setupGifPlayer() {
        gifPlayer.backgroundColor = .blue
        view.addSubview(gifPlayer)
        do {
            let data = favoriteGif.data
            guard let favGif = try UIImage(imageData: data) else { fatalError() } //FIXME: Fragile
            //gifPlayer.image = favGif
            gifPlayer.setGifImage(favGif)

        }
        catch { fatalError() }  //FIXME: Propagate Error
    }
    
    @objc func doubleTapped() {
        do { try favorites.remove(favoriteGif) }
        catch { fatalError() } //FIXME: Fragile handle error
    }
}

extension FavoriteGifPlayer : SwiftyGifDelegate
{
    func gifURLDidFinish(sender: UIImageView) { print("gifDidFinish") }
    func gifURLDidFail(sender: UIImageView, url: URL, error: Error?) { print("gifURLDidFail", url) }
    func gifDidStart(sender: UIImageView) { print("gifDidStart") }
}

