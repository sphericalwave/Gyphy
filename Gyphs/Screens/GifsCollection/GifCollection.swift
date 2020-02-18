//
//  CollectionScreen.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class GifCollection: UICollectionViewController
{
    let favorites: FavoriteGifs
    
    init(layout: GifsLayout, favorites: FavoriteGifs, cellClass: AnyClass, cellId: String) {   //FIXME: AnyClass is obnoxious
        self.favorites = favorites
        super.init(collectionViewLayout: layout)
        collectionView.register(cellClass, forCellWithReuseIdentifier: cellId) //FIXME: Remove static
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.delegate = self
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GifCell else { fatalError() }
        //FIXME: SwiftUI addresses the autolayout challenge
        let frame = CGRect(x: 0.0, y: 36.0, width: 414.0, height: 414.0) //241 is too low
        let localGif = cell.localGif()
        let gifPlayer = GifPlayer(bounds: frame, gif: localGif, favorites: favorites)   //FIXME: Naming Contradiction
        let gifDetailScreen2 = GifDetailScreen2(favorites: favorites, gifPlayer: gifPlayer)
        navigationController?.pushViewController(gifDetailScreen2, animated: true)
    }
}
