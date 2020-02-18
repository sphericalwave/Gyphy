//
//  FavGifCollection.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

//FIXME: Refactor, casting is the cause, thanks Apple
class FavGifCollection: UICollectionViewController
{
    let favorites: FavoriteGifs
    let emptyMessageLabel: UILabel
    
    init(layout: GifsLayout, favorites: FavoriteGifs, cellClass: AnyClass, cellId: String) {   //FIXME: AnyClass is obnoxious
        self.favorites = favorites
        let emptyMessageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        emptyMessageLabel.text = "Double Tap Gifs to Add Favorite Gifs"
        emptyMessageLabel.textAlignment = .center
        self.emptyMessageLabel = emptyMessageLabel
        super.init(collectionViewLayout: layout)
        collectionView.register(cellClass, forCellWithReuseIdentifier: cellId) //FIXME: Remove static
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.delegate = self

    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? FavGifCell else { fatalError() }
        //FIXME: SwiftUI addresses the autolayout challenge
        let frame = CGRect(x: 0.0, y: 36.0, width: 414.0, height: 414.0) //241 is too low
        let favGif = cell.favGif()
        let favGifPlayer = FavoriteGifPlayer(bounds: frame, favoriteGif: favGif, favorites: favorites)   //FIXME: Naming Contradiction
        let gifDetailScreen3 = GifDetailScreen3(favorites: favorites, favGifPlayer: favGifPlayer)   //FIXME: Duplication
        navigationController?.pushViewController(gifDetailScreen3, animated: true)
    }
    
    //FIXME: Don't love this
    func showEmptyMessage(_ bool: Bool) {
        if bool {
            DispatchQueue.main.async {
                self.emptyMessageLabel.center = self.collectionView.center
                self.collectionView.addSubview(self.emptyMessageLabel)
            }
        }
        else {
            DispatchQueue.main.async {
                self.emptyMessageLabel.removeFromSuperview()
            }
        }
    }
}
