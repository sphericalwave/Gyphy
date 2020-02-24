//
//  GyphySearchUrlTests.swift
//  NetworkTests
//
//  Created by Aaron Anthony on 2020-02-03.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class GyphySearchUrlTests: XCTestCase
{
    func testSearchUrl() {
        let searchExampleUrl = "https://api.giphy.com/v1/gifs/search?api_key=neYTrWXXDuHgHWqtlrH1vmjI6FGyQUi8&q=elon&limit=25&offset=0&rating=G&lang=en"
        let searchUrl = GyphySearchUrl(query: "elon", limit: 25, apiKey: "neYTrWXXDuHgHWqtlrH1vmjI6FGyQUi8")
        XCTAssertNotNil(searchUrl.url())
        XCTAssertEqual(searchUrl.url(), URL(string: searchExampleUrl)!)
    }
}
