//
//  SearchBar.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class SearchEngine: UISearchController
{
    init(searchResultsScreen: UIViewController?) {
        super.init(searchResultsController: searchResultsScreen)
        let searchBar = self.searchBar
        searchBar.placeholder = "Search for Gyphs"
        searchBar.showsCancelButton = true
        searchResultsUpdater = self
        obscuresBackgroundDuringPresentation = false
        hidesNavigationBarDuringPresentation = true
    }
    required init?(coder: NSCoder) { fatalError() }
    
    func searching() { searchBar.isLoading = true }
    
    func endSearch() { searchBar.isLoading = false }
}

extension SearchEngine: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        print("func updateSearchResults(for searchController: UISearchController)")
    }
}
