//
//  GifCell.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class GifCell: UICollectionViewCell
{
    var gifPlayer: GifPlayer?   //FIXME: Be Immutable. Framework is blocking it.
    static let cellId = "It Doesn't Matter Who We Are, What matters is our plan"    //FIXME: Remove Static
    
    func localGif() -> LocalGif {
        guard let gif = gifPlayer?.localGif else { fatalError() }
        return gif
    }
}

//FIXME: Refactor this is duplication
class FavGifCell: UICollectionViewCell
{
    var gifPlayer: FavoriteGifPlayer?   //FIXME: Be Immutable. Framework is blocking it.
    static let cellId = "Something Else"    //FIXME: Remove Static
    
    func favGif() -> FavoriteGif {
        guard let gif = gifPlayer?.favoriteGif else { fatalError() }
        return gif
    }
}
