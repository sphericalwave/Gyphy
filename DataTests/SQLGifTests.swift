//
//  SQLGifTests.swift
//  DataTests
//
//  Created by Aaron Anthony on 2020-02-03.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class SQLGifTests: XCTestCase {
    
    var db: SQLiteDatabase! //TODO: Make into a TestSQLiteDatabase
    let path = "/Users/DarkKnight/Desktop/Kinduct/Gyphs/Gyphs/Data/testDb.sqlite"
    
    override func setUp() {
        self.db = try! SQLiteDatabase(path: path)
    }
    
    override func tearDown() {
        try! db.dropTable() //Reset the testDb.sqlite for each test
        self.db = nil
    }

    func testUrl() {
        //let gif = SQLGif(id: 1, db: db)
        XCTFail()
    }
}
