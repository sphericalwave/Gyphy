//
//  GifView.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit
import SwiftyGif

class GifPlayer: UIViewController
{
    var localGif: LocalGif
    let gifPlayer: UIImageView
    let spinner = UIActivityIndicatorView(style: .large)    //FIXME: Decorate into Subclass that init(bounds: CGRect)
    let heartIcon: HeartIcon //FIXME: Rename
    let favorites: FavoriteGifs
    
    init(bounds: CGRect, gif: LocalGif, favorites: FavoriteGifs) {
        self.localGif = gif
        self.gifPlayer = UIImageView(frame: bounds)
        self.heartIcon = HeartIcon(bounds: bounds)
        self.favorites = favorites
        super.init(nibName: nil, bundle: nil)
        gifPlayer.delegate = self
        let doubleTap = DoubleTap(target: self, action: #selector(doubleTapped)) //FIXME: Hidden Dependency
        view.addGestureRecognizer(doubleTap)
        view.backgroundColor = .lightGray
        NotificationCenter.default.addObserver(self, selector: #selector(removedFav), name: .didRemoveFavorite, object: nil)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGifPlayer()
        setupSpinner()
        view.addSubview(heartIcon)
        setupHeart()
    }
    
    //FIXME: Naming
    func setupHeart() {   //FIXME: Refactor: gnarly mutable state stuff
        heartIcon.isHidden = true
        let favGifs = favorites.all()
        for favGif in favGifs {     //FIXME: Efficiency is questionable
            if favGif.id == localGif.id() {
                localGif.fav = true
                heartIcon.isHidden = false
                return
            }
        }
    }
    
    func setupSpinner() {
        spinner.center = gifPlayer.center   //TODO: Why does this work & view.center is cray?
        view.addSubview(spinner)
        spinner.startAnimating()
    }
    
    func setupGifPlayer() {
        view.addSubview(gifPlayer)
        gifPlayer.setGifFromURL(localGif.url(), showLoader: false)
    }
    
    @objc func removedFav() { setupHeart() }
    
    @objc func doubleTapped() {
        if localGif.fav {
            localGif.fav = false
            heartIcon.isHidden = true
            do { try favorites.remove(localGif) }
            catch { return } //FIXME: Fragile handle error
        }
        else {
            localGif.fav = true
            heartIcon.isHidden = false
            do { try favorites.save(localGif) }
            catch { return } //FIXME: Fragile
        }
    }
}

extension GifPlayer : SwiftyGifDelegate
{
    func gifURLDidFinish(sender: UIImageView) { spinner.isHidden = true }
    func gifURLDidFail(sender: UIImageView, url: URL, error: Error?) { print("gifURLDidFail", url) }
    func gifDidStart(sender: UIImageView) { print("gifDidStart") }
}
