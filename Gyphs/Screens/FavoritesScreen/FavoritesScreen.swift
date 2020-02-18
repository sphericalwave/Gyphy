//
//  FavoritesScreen.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2019 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class FavoritesScreen: UIViewController
{
    let data: FavoriteScreenData
    let gifsScreen: FavGifCollection
    
    init(gifsScreen: FavGifCollection, data: FavoriteScreenData) {
        self.data = data
        self.gifsScreen = gifsScreen
        super.init(nibName: nil, bundle: nil)
        guard let heart = UIImage(systemName: "heart.circle") else { fatalError() }
        self.tabBarItem = UITabBarItem(title: "Favs", image: heart, tag: 1)
        self.title = "Favorites"
        gifsScreen.collectionView.backgroundColor = .red
    }
    required init?(coder: NSCoder) { fatalError("Bad Monkey!") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embed(viewController: gifsScreen, inContainerView: view)
    }
}
