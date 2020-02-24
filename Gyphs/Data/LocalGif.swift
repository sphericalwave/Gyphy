//
//  LocalGif.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import Foundation

struct LocalGif: Codable, Equatable
{
    let gif: Gif
    let uuid: UUID
    var fav: Bool   //FIXME: Be Immutable
    
    init(gif: Gif) {
        self.gif = gif
        self.uuid = UUID() //FIXME: hiden dependency
        self.fav = false
    }
    
    func id() -> String { return gif.id } 
    
    func url() -> URL { return gif.url() }
}

extension LocalGif: Hashable //for DiffableDataSource
{
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: LocalGif, rhs: LocalGif) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
}
