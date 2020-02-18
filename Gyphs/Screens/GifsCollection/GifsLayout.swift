//
//  GifsLayout.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class GifsLayout: UICollectionViewCompositionalLayout
{
    init(junk: Int) {   //FIXME: init marked unavailable? Decorator Pattern is A+
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth( 1.0 / 2 ), heightDimension: .fractionalHeight( 1.0 ))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 9, leading: 9, bottom: 9, trailing: 9)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth( 1.0 / 2 ))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        super.init(section: section)
    }
    
    required init?(coder: NSCoder) { fatalError() }
}


