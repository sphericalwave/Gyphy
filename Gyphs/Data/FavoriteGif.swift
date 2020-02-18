//
//  FavoriteGif.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import Foundation

//FIXME: Create a Gif Protocol
struct FavoriteGif: Codable, Equatable
{
    let data: Data
    let gif: Gif
    let uuid: UUID
    let id: String
    //var fav: Bool   //FIXME: Be Immutable
}

extension FavoriteGif: Hashable //for DiffableDataSource
{
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: FavoriteGif, rhs: FavoriteGif) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
