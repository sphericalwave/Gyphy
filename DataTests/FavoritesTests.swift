//
//  FavoritesTests.swift
//  DataTests
//
//  Created by Aaron Anthony on 2020-02-13.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class FavoritesTests: XCTestCase {
    
    let favorites = FavoriteGifs()

    func testSavingLocalGif() {
        let url = URL(string: "www.sphericalwave.com")!
        let oImage = OriginalImage(url: url)
        let images = Images(original: oImage)
        let gif = Gif(images: images, id: "test_id")
        let localGif = LocalGif(gif: gif)
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(localGif)
            try favorites.save(fileName: "test_file", with: data)
        }
        catch { XCTFail() }
    }
    
    func testReadLocalGif() {
        let jsonDecoder = JSONDecoder()
          do {
            let data = try favorites.data(for: "test_id")
            let localGif = try jsonDecoder.decode(LocalGif.self, from: data)
            print(localGif.uuid)
          }
          catch {
            print(error)
            XCTFail()
        }
    }
    
    func testURLForFilename() {
        let testURL = favorites.url(for: "Test")
        let absPath = (testURL.absoluteString)
        let expectedPath = "/Users/DarkKnight/Library/Developer/CoreSimulator/Devices/03D82645-1BD8-4E03-BC8D-9C0E7957E0B3/data/Containers/Data/Application/62BA36CE-60BF-412A-9384-9326EF922B1D/Documents"
        XCTAssertEqual(absPath, expectedPath)
    }
}

//These url are different in the third back directory
//("file:///Users/DarkKnight/Library/Developer/CoreSimulator/Devices/03D82645-1BD8-4E03-BC8D-9C0E7957E0B3/data/Containers/Data/Application/3B1F0DAB-DCD8-469C-BBB9-9D1C50647610/Documents/Test")
//("file:///Users/DarkKnight/Library/Developer/CoreSimulator/Devices/03D82645-1BD8-4E03-BC8D-9C0E7957E0B3/data/Containers/Data/Application/89B2048E-3327-49F2-9E9B-52792EFF6DB9/Documents/Test")
