//
//  FilesTests.swift
//  DataTests
//
//  Created by Aaron Anthony on 2020-02-11.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class FilesTests: XCTestCase
{
    var directory: Directory!
    
    override func setUp() {
        do { self.directory = try Directory(name: "test") }
        catch { fatalError() }
    }

    override func tearDown() {
        self.directory = nil
    }
    
    func testReadAndWrite() {
        let testContent = "Batman Forever!"
        let fileURL = directory.fileURL(fileName: "Batfile.text")
        print(fileURL)
        do {
            try directory.write(text: "Batman Forever!", to: fileURL)
            let fileContent = try directory.read(fileURL: fileURL)
            XCTAssertEqual(testContent, fileContent)
        }
        catch { XCTFail() }
    }
    
    func testMoveFile() {
        
    }
    
    func testDescription() {
        do { try directory.description() }
        catch { XCTFail() }
    }
    
    //    func moveFile() {
//        let oldPath = dir.appendingPathComponent("fileMove.txt")
//        let newPath = dir.appendingPathComponent("data/fileMove.txt")
//        do { try fileManager.moveItem(at: oldPath, to: newPath) }
//        catch { print("cant move the file...") }
//    }
//
//    func copyFile() {
//        let originalFile = dir.appendingPathComponent("file1.txt")
//        let copyFile = dir.appendingPathComponent("copy.txt")
//        do { try fileManager.copyItem(at: originalFile, to: copyFile) }
//        catch { print("can't copy") }
//    }
//
//    //File permissions
//    func filePermission() {
//        //FIXME: Remove
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
//        let url = NSURL(fileURLWithPath: path)
//        guard let pathComponent = url.appendingPathComponent("file1.txt") else { fatalError() }
//        let filePath = pathComponent.path
//
//        if fileManager.fileExists(atPath: filePath) { print("File Available") }
//        else { print("File not available") }
//
//        //FIXME: Nasty
//        var filePermission:NSString = ""
//        if (fileManager.isWritableFile(atPath: filePath)){
//            filePermission = filePermission.appending("file is writable") as NSString
//        }
//        if(fileManager.isReadableFile(atPath: filePath)){
//            filePermission = filePermission.appending("file is readable") as NSString
//        }
//        if(fileManager.isExecutableFile(atPath: filePath)){
//            filePermission = filePermission.appending("file is executable") as NSString
//        }
//        print(filePermission)
//    }
//
//    func compareFiles() {   //FIXME: Inject File Paths
//        //FIXME: remove me
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
//        let url = NSURL(fileURLWithPath: path)
//        guard let pathComponent1 = url.appendingPathComponent("file1.txt") else { fatalError() }
//        guard let pathComponent2 = url.appendingPathComponent("file2.txt") else { fatalError() }
//        let filePath1 = pathComponent1.path
//        let filePath2 = pathComponent2.path
//        print( fileManager.contentsEqual(atPath: filePath1, andPath: filePath2))
//    }
//
//    func removeFile() {
//        let removeFile = dir.appendingPathComponent("copy.txt")
//        do { try fileManager.removeItem(at: removeFile) }
//        catch { print("cant remove file...") }
//    }
//
//    func contentsOfDirectory() {
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
//        let url = NSURL(fileURLWithPath: path)
//        let filePath = url.path
//        print(try! fileManager.contentsOfDirectory(atPath: filePath!))
//    }
}
