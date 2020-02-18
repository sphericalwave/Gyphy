//
//  PaginationTests.swift
//  JSONTests
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class PaginationTests: XCTestCase
{
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    let pagination = Pagination(totalCount: 90290, count: 1, offset: 0)
    let jsonString = """
        {
            "total_count": 90290,
            "count": 1,
            "offset": 0
        }
        """
    
    override func setUp() {
        encoder.keyEncodingStrategy = .convertToSnakeCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func testEncodeDecode() {
        guard let data = try? encoder.encode(pagination) else { fatalError() }
        XCTAssertNotNil(data)
        guard let pagination2 = try? decoder.decode(Pagination.self, from: data) else { fatalError() }
        XCTAssertEqual(pagination, pagination2)
    }
    
    func testSerialization() {
        guard let jsonData = jsonString.data(using: .utf8) else { fatalError() }
        do {
            let pagination2 = try decoder.decode(Pagination.self, from: jsonData)
            XCTAssertEqual(pagination, pagination2)
        }
        catch {
            print(error.localizedDescription)
            XCTFail()
        }
    }
}

