//
//  GyphyApiTrendingUrl.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import Foundation

class GyphyTrendingUrl: GyphyUrl
{
    init(limit: Int, rating: GyphyRating, apiKey: String) {
        super.init(apiKey: apiKey)
        components.scheme = "https"
        components.host = "api.giphy.com"
        components.path = "/v1/\(GyphyRessource.gifs.rawValue)/\(GyphyEndpoint.trending.rawValue)"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "rating", value: GyphyRating.G.rawValue) ]
    }
}

//eg.
//https://api.giphy.com/v1/gifs/trending?api_key=neYTrWXXDuHgHWqtlrH1vmjI6FGyQUi8&limit=25&rating=G
