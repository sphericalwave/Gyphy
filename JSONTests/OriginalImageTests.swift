//
//  OriginalImageTests.swift
//  JSONTests
//
//  Created by Aaron Anthony on 2020-01-30.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class OriginalImageTests: XCTestCase
{
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
//    let img = OriginalImage(height: "360", width: "480", size: "4313017",
//                            url: URL(string: "https://www.test.com")!,
//                            frames: "61", hash: "f4459874959cf081b1815f9551d50e2f",
//                            mp4: "https://sphericalwave.com", mp4Size: "383439",
//                            webp: "https://whatever.etc", webpSize: "624414")
    let img = OriginalImage(url: URL(string: "https://www.test.com")!)
    
    let jsonString = """
        {
            "frames": "61",
            "hash": "f4459874959cf081b1815f9551d50e2f",
            "height": "360",
            "mp4": "https://sphericalwave.com",
            "mp4_size": "383439",
            "size": "4313017",
            "url": "https://www.test.com",
            "webp": "https://whatever.etc",
            "webp_size": "624414",
            "width": "480"
        }
        """
    
    override func setUp() {
        //TODO: Not Neccessary in this case
        encoder.keyEncodingStrategy = .convertToSnakeCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func testEncodeDecode() {
        guard let data = try? encoder.encode(img) else { fatalError() }
        XCTAssertNotNil(data)
        do {
            let anImg = try decoder.decode(OriginalImage.self, from: data)
            XCTAssertEqual(anImg, img)
        }
        catch {
            print(error.localizedDescription)
            XCTFail()
        }
    }
    
    func testSerialization() {
        guard let jsonData = jsonString.data(using: .utf8) else { fatalError() }
        do {
            let anImg = try decoder.decode(OriginalImage.self, from: jsonData)
            XCTAssertEqual(img, anImg)
        }
        catch {
            print(error.localizedDescription)
            XCTFail()
        }
    }
}
