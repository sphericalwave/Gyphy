//
//  TrendingScreen.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2019 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class TrendingScreen: UIViewController
{
    let searchEngine: SearchEngine
    let gifsScreen: GifCollection
    let data: TrendingScreenData
    let apiKey: String
    
    init(searchEngine: SearchEngine, gifsScreen: GifCollection, data: TrendingScreenData, apiKey: String) {
        self.searchEngine = searchEngine
        self.gifsScreen = gifsScreen
        self.data = data
        self.apiKey = apiKey
        super.init(nibName: nil, bundle: nil)
        guard let tornado = UIImage(systemName: "flame") else { fatalError() }
        tabBarItem = UITabBarItem(title: "Trending", image: tornado, tag: 1)
        title = "Trending"
        navigationItem.searchController = searchEngine
        navigationItem.hidesSearchBarWhenScrolling = false
        searchEngine.searchBar.delegate = self  //FIXME: Confirm
        gifsScreen.collectionView.backgroundColor = .blue   //FIXME: Encapsulation Violation
    }
    required init?(coder: NSCoder) { fatalError("Son, Just don't") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embed(viewController: gifsScreen, inContainerView: view)
    }
}

//FIXME: There's a lot of repetition here
extension TrendingScreen: UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {   //FIXME: This is a bit gnarly
        guard let searchText = searchBar.text else { return }
        let gyphySearch = GyphySearchUrl(query: searchText, limit: 15, apiKey: apiKey)
        let search = Search(gyphyURL: gyphySearch, diffableData: data.diffableData, searchEngine: searchEngine) //FIXME: Naming
        search.execute()
        searchEngine.searching()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //Replace Previous Results
        //FIXME: Might be able to make this better
        //Cache the previous search
        let gyphyTrending = GyphyTrendingUrl(limit: 15, rating: .G, apiKey: apiKey)
        let search = Search(gyphyURL: gyphyTrending, diffableData: data.diffableData, searchEngine: searchEngine) //FIXME: Naming
        search.execute()
        //FIXME: Cancel causes an unneccessary reload of Gifs
    }
}
