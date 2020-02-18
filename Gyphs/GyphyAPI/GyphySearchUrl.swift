//
//  GyphyApiSearchUrl.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import Foundation

class GyphySearchUrl: GyphyUrl
{
    init(query: String, limit: Int, apiKey: String) {
        super.init(apiKey: apiKey)
        components.scheme = "https" //TODO: Factor Common Stuff into base constructor
        components.host = "api.giphy.com"
        components.path = "/v1/\(GyphyRessource.gifs.rawValue)/\(GyphyEndpoint.search.rawValue)"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "offset", value: String(0)),
            URLQueryItem(name: "rating", value: GyphyRating.G.rawValue),
            URLQueryItem(name: "lang", value: "en") ]
    }
}

//example url
//https://api.giphy.com/v1/trending?api_key=neYTrWXXDuHgHWqtlrH1vmjI6FGyQUi8&limit=10&rating=G

