//
//  MetaTests.swift
//  JSONTests
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class MetaTests: XCTestCase
{
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    let meta = Meta(status: 200, msg: "OK", responseId: "4837e2a4150ac37fb3157bcef8c9421364b1907d")
    //let meta = Meta(status: 200, msg: "OK")
    let jsonString = """
        {
            "status": 200,
            "msg": "OK",
            "response_id": "4837e2a4150ac37fb3157bcef8c9421364b1907d"
        }
        """
    
    override func setUp() {
        encoder.keyEncodingStrategy = .convertToSnakeCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func testEncodeDecode() {
        guard let data = try? encoder.encode(meta) else { fatalError() }
        XCTAssertNotNil(data)
        guard let meta2 = try? decoder.decode(Meta.self, from: data) else { fatalError() }
        XCTAssertEqual(meta, meta2)
    }
    
    func testSerialization() {
        guard let jsonData = jsonString.data(using: .utf8) else { fatalError() }
        do {
            let aMeta = try decoder.decode(Meta.self, from: jsonData)
            print(aMeta.status)
            XCTAssertEqual(meta, aMeta)
        }
        catch {
            print(error.localizedDescription)
            XCTFail()
        }
    }
}
