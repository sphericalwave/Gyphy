//
//  GifScreen.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2019 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class GifDetailScreen2: UIViewController
{
    let gifPlayer: GifPlayer
    let favorites: FavoriteGifs
    
    init (favorites: FavoriteGifs, gifPlayer: GifPlayer) {
        self.gifPlayer = gifPlayer
        self.favorites = favorites
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        title = "Gif Details"
        hidesBottomBarWhenPushed = true
    }
    required init?(coder: NSCoder) { fatalError("XIBs are Obnoxious") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embed(viewController: gifPlayer, inContainerView: view)
    }
}

//FIXME: Refactor Duplicate Class
class GifDetailScreen3: UIViewController
{
    let favGifPlayer: FavoriteGifPlayer
    let favorites: FavoriteGifs
    
    init (favorites: FavoriteGifs, favGifPlayer: FavoriteGifPlayer) {
        self.favGifPlayer = favGifPlayer
        self.favorites = favorites
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        title = "Fav Gif Details"
        hidesBottomBarWhenPushed = true
    }
    required init?(coder: NSCoder) { fatalError("XIBs are Obnoxious") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embed(viewController: favGifPlayer, inContainerView: view)
    }
}

