//
//  NetworkTests.swift
//  NetworkTests
//
//  Created by Aaron Anthony on 2020-02-01.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class HttpClientTests: XCTestCase
{
    var httpClient: HttpClient!
    let channel = FakeChannel()
    
    override func setUp() {
        super.setUp()
        httpClient = HttpClient(channel: channel)
    }
    
    override func tearDown() { super.tearDown() }
    
    //FIXME: Won't compile?
//    func testGetRequest() {
//        let trending = GyphyTrendingUrl(limit: 1, rating: .G)   //FIXME: GyphyApiCall can be decorated as two subclasses
//        let url = trending.url()
//        httpClient.httpGet(url: url) { (success, response) in
//            // Return data
//           // print(response)
//        }
//        XCTAssert(channel.lastURL == url)
//    }
    
    func testResumeCalled() {
        let dataTask = FakeResponse()
        channel.nextResponse = dataTask
        guard let url = URL(string: "https://mockurl") else { fatalError() }
        httpClient.httpGet(url: url) { (success, response) in
            // Return data
        }
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func testData() {
        let expectedData = "{}".data(using: .utf8)
        
        channel.nextData = expectedData
        
        var actualData: Data?
        httpClient.httpGet(url: URL(string: "http://mockurl")!) { (data, error) in
            actualData = data
        }
        
        XCTAssertNotNil(actualData)
    }
    
}
