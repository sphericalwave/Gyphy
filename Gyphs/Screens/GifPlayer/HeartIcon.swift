//
//  FavoriteIndicator.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class HeartIcon: UIImageView
{
    init(bounds: CGRect) {
        guard let heart = UIImage(systemName: "heart.circle") else { fatalError() } //FIXME: Hidden Dependency
        let redHeart = heart.withTintColor(.red, renderingMode: .alwaysOriginal)
        let length = (bounds.width / 4)    //FIXME: Hidden Dependency
        let favIconBounds = CGRect(x: length * 3, y: length * 3, width: length , height: length) //FIXME: Hidden Dependency
        super.init(frame: favIconBounds)
        self.image = redHeart
    }
    required init?(coder: NSCoder) { fatalError() }
}
