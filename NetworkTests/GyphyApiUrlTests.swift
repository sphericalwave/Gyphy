//
//  GyphyApiUrlTests.swift
//  GyphTests
//
//  Created by Aaron Anthony on 2020-01-31.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class GyphyApiUrlTests: XCTestCase {
    
    let apiKey: String = "neYTrWXXDuHgHWqtlrH1vmjI6FGyQUi8"
    
    func testApiKey() {
        let url = GyphyUrl(apiKey: apiKey)
        XCTAssertEqual(url.apiKey, apiKey)
    }
}
