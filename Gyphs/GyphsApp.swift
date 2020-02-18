//
//  TabBarScreen.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2019 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class GyphsApp: BlackTabScreen
{
    let apiKey: String
    let favorites: FavoriteGifs
    
    init(apiKey: String, favorites: FavoriteGifs) {
        self.favorites = favorites
        self.apiKey = apiKey
        super.init()
        viewControllers = [trendingScreen(), favoritesScreen()]
        selectedIndex = 0
    }
    required init?(coder: NSCoder) { fatalError() }
    
    func trendingScreen() -> UINavigationController {
        let trendingURL = GyphyTrendingUrl(limit: 15, rating: .G, apiKey: apiKey)
        let gifsScreen = GifCollection(layout: GifsLayout(junk: 1), favorites: favorites, cellClass: GifCell.self, cellId: GifCell.cellId) //FIXME: remove junk
        let data = TrendingScreenData(gyphyURL: trendingURL, gifsScreen: gifsScreen, favorites: favorites)
        data.start() //FIXME: Fragile Api
        let sE = SearchEngine(searchResultsScreen: nil)
        let trendingScreen = TrendingScreen(searchEngine: sE, gifsScreen: gifsScreen, data: data, apiKey: apiKey)
        let nav = BlackNav(screen: trendingScreen)
        return nav
    }
    
    func favoritesScreen() -> UINavigationController {
        let gifsScreen = FavGifCollection(layout: GifsLayout(junk: 1), favorites: favorites, cellClass: FavGifCell.self, cellId: FavGifCell.cellId) //FIXME: remove junk
        let data = FavoriteScreenData(favorites: favorites, gifsScreen: gifsScreen)
        data.start()                //FIXME: Fragile Api
        let favsScreen = FavoritesScreen(gifsScreen: gifsScreen, data: data) //Delegate is still set
        let nav = BlackNav(screen: favsScreen)
        return nav
    }
}


