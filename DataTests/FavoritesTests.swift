//
//  FavoritesTests.swift
//  DataTests
//
//  Created by Aaron Anthony on 2020-02-13.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class FavoritesTests: XCTestCase
{
    var favoriteGifs: FavoriteGifs!
    var localGif: LocalGif!
    
    override func setUp() {
        let url = URL(string: "https://media2.giphy.com/media/lnOG1o6Cdc3kKjuray/giphy.gif?cid=ff71a59d4837e2a4150ac37fb3157bcef8c9421364b1907d&rid=giphy.gif")
        let originalImage = OriginalImage(url: url!)
        let images = Images(original: originalImage)
        let gif = Gif(images: images, id: "testGif")
        self.localGif = LocalGif(gif: gif)
        self.favoriteGifs = FavoriteGifs()
    }
    
    override func tearDown() {
        favoriteGifs = nil
        localGif = nil
    }
    
    func testSavingAndRemovingLocalGif() {
        do {
            try favoriteGifs.save(localGif)
            //wait(for: [expectation], timeout: 1.0)
            //expectation.fulfill()
            //let id = localGif.id()
            //let favGifData = try favoriteGifs.data(for: id)
            //let jsonDecoder = JSONDecoder()
            //let favGif = try jsonDecoder.decode(FavoriteGif.self, from: favGifData)
            //try favoriteGifs.remove(favoriteGif: favGif)
        }
        catch { XCTFail() }
    }
}

//These url are different in the third back directory
//("file:///Users/DarkKnight/Library/Developer/CoreSimulator/Devices/03D82645-1BD8-4E03-BC8D-9C0E7957E0B3/data/Containers/Data/Application/3B1F0DAB-DCD8-469C-BBB9-9D1C50647610/Documents/Test")
//("file:///Users/DarkKnight/Library/Developer/CoreSimulator/Devices/03D82645-1BD8-4E03-BC8D-9C0E7957E0B3/data/Containers/Data/Application/89B2048E-3327-49F2-9E9B-52792EFF6DB9/Documents/Test")
