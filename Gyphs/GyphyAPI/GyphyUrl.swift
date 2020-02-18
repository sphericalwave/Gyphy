//
//  GiphyApiUrl.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import Foundation

//TODO: Get Decorator Pattern Werking
//TODO: Convert into a protocol?
class GyphyUrl
{
    let apiKey: String
    var components = URLComponents()    //TODO: Contain Mutable State
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func url() -> URL {
        guard let url = components.url else { fatalError() }
        return url
    }
}

enum GyphyEndpoint: String {
    case trending
    case search
}

enum GyphyRessource: String {
    case gifs
    case stickers
}

enum GyphyRating: String {
    case G
    case PG
    //TODO: Add other categories
}
