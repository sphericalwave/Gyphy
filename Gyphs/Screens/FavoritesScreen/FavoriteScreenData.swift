//
//  FavoriteScreenData.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class FavoriteScreenData: NSObject
{
    let diffableData: UICollectionViewDiffableDataSource<Section, FavoriteGif>
    let favorites: FavoriteGifs
    let gifsScreen: FavGifCollection
    
    init(favorites: FavoriteGifs, gifsScreen: FavGifCollection) {
        self.favorites = favorites
        self.gifsScreen = gifsScreen
        self.diffableData = UICollectionViewDiffableDataSource<Section, FavoriteGif>(collectionView: gifsScreen.collectionView) {
            (collectionView, indexPath, gif) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavGifCell.cellId, for: indexPath) as? FavGifCell else { fatalError() }//FIXME: Remove Static
            let favGifPlayer = FavoriteGifPlayer(bounds: cell.contentView.bounds, favoriteGif: gif, favorites: favorites)
            gifsScreen.embed(viewController: favGifPlayer, inContainerView: cell.contentView)
            cell.gifPlayer = favGifPlayer  //FIXME: Be Immutable
            return cell
        }
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(start), name: .didAddFavorite, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(start), name: .didRemoveFavorite, object: nil)
    }
    
    @objc func start() {  //FIXME: Naming...Refresh?
        var snapshot = NSDiffableDataSourceSnapshot<Section, FavoriteGif>() //FIXME: Be Immutable
        let favoriteGifs = favorites.all()
        if favoriteGifs.count == 0 { gifsScreen.showEmptyMessage(true) }
        else { gifsScreen.showEmptyMessage(false) }
        snapshot.appendSections([.main])
        snapshot.appendItems(favoriteGifs)
        self.diffableData.apply(snapshot, animatingDifferences: true, completion: nil)
    }
}
