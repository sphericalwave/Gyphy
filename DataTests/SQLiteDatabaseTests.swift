//
//  DataTests.swift
//  DataTests
//
//  Created by Aaron Anthony on 2020-02-03.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class SQLiteDatabaseTests: XCTestCase
{
    var db: SQLiteDatabase!
    let path = "/Users/DarkKnight/Desktop/Kinduct/Gyphs/Gyphs/Data/testDb.sqlite"
    
    override func setUp() {
        self.db = try! SQLiteDatabase(path: path)
    }
    
    override func tearDown() {
        try! db.dropTable() //Reset the testDb.sqlite for each test
        self.db = nil
    }
    
    func testTableCreation() {
        XCTAssertNoThrow(try db.createTable(sql: SQLGifs.gifsTableSQL))
    }
    
    func testDropTable() {
        XCTAssertNoThrow(try db.createTable(sql: SQLGifs.gifsTableSQL))
        XCTAssertNoThrow(try db.dropTable())
    }
    
    func testPrepareStatements() {
        XCTAssertThrowsError(try db.prepareStatement(sql: "Some Junk"))
    }
    
    func testErrorMessage() {
        //FIXME: Not a great test
        XCTAssertEqual(db.errorMessage(), "not an error")
    }
}
