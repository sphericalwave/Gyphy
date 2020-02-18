//
//  SQLGifsTests.swift
//  DataTests
//
//  Created by Aaron Anthony on 2020-02-03.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class SQLGifsTests: XCTestCase {
    
    var gifs: SQLGifs!
    var db: SQLiteDatabase!
    let path = "/Users/DarkKnight/Desktop/Kinduct/Gyphs/Gyphs/Data/testDb.sqlite"
    let url = "www.sphericalwave.com"
    
    override func setUp() {
        self.db = try! SQLiteDatabase(path: path)
        self.gifs = SQLGifs(database: db)
    }
    
    override func tearDown() {
        try! db.dropTable() //Reset the testDb.sqlite for each test
        self.db = nil
    }

    func testAddSqlGif() {
        let sqlGif = try! gifs.add(url: url, fav: true)
        XCTAssertEqual(sqlGif.url(), URL(string: url)!)
        XCTAssertEqual(sqlGif.fav(), true)   //FIXME: The fav property is redundant, if it's stored in sql it is a fav
    }
    
    func testDeleteSqlGif() {
        XCTFail()
    }
    
    func testForInLoop() {
        XCTFail()
    }
    
    func breakForInLoop() {
        XCTFail()
    }
    
    func testGifCount() {
        _ = try! gifs.add(url: url, fav: true)
        _ = try! gifs.add(url: url, fav: true)
        XCTAssertEqual(gifs.count(), 2)
    }
    
    func testGifId() {
        let gif = try! gifs.add(url: url, fav: true)
        let id = gifs.gifId(url: url)
        XCTAssertEqual(gif.id, id)  //TODO: Surprise this passes
    }
}
