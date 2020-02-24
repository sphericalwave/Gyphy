//
//  TestSave.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import Foundation

//FIXME: This Class needs to be refactored
class FavoriteGifs: NSObject //FIXME: Naming
{
    let fileSystem: FileManager
    let documentDirectoryURL: URL
    let notifications: NotificationCenter
    
    enum FileError: Error {
        case fileExists
        case invalidDirectory
        case writeFailed
        case readFailed
        case fileDoesntExists
    }
    
    init(fileSystem: FileManager = .default) {
        guard let documentDirectoryURL = fileSystem.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError() }
        self.notifications = NotificationCenter.default //FIXME: Hiddent Dependency
        self.documentDirectoryURL = documentDirectoryURL
        self.fileSystem = fileSystem
    }
    
    func save(_ localGif: LocalGif) throws {
        let fileURL = url(for: localGif.id())
        print(fileURL.absoluteString)
        let request = URLRequest(url: localGif.url())
        let session = URLSession.shared
        let favGifDownload = session.dataTask(with: request) { data, response, error in
            guard let data = data else { fatalError() }
            let favGif = FavoriteGif(data: data, gif: localGif.gif, uuid: UUID(), id: localGif.id())
            let encoder = JSONEncoder()
            do {
                let encodedFavGif = try encoder.encode(favGif)
                try encodedFavGif.write(to: fileURL) //Overwrites if existing
                self.notifications.post(name: .didAddFavorite, object: nil)
            }
            catch { fatalError() }  //FIXME: Fragile
        }
        favGifDownload.resume()
    }
    
    //FIXME: Can i remove this Redundancy...Not yet
    func remove(localGif: LocalGif) throws {
        let fileURL = url(for: localGif.id())
        print("Removing file atURL \(fileURL.relativeString)")
        do { try fileSystem.removeItem(at: fileURL) }
        catch { throw error }  //FIXME: Fragile
        notifications.post(name: .didRemoveFavorite, object: nil)
    }
    
    func remove(favoriteGif: FavoriteGif) throws {
        let fileURL = url(for: favoriteGif.id)
        print("Removing file atURL \(fileURL.relativeString)")
        do { try fileSystem.removeItem(at: fileURL) }
        catch { throw error }  //FIXME: Fragile
        notifications.post(name: .didRemoveFavorite, object: nil)
    }
    
    func url(for fileName: String) -> URL {
        return documentDirectoryURL.appendingPathComponent(fileName)
    }
    
    func data(for fileName: String) throws -> Data {
        let fileURL = url(for: fileName)
        print("reading file atURL \(fileURL.relativeString)")
        do { return try Data(contentsOf: fileURL) }
        catch { throw FileError.readFailed }
    }
    
    func printFileNames() throws {
        do {
            let fileNames = try fileSystem.contentsOfDirectory(atPath: documentDirectoryURL.path)
            for fileName in fileNames { print(fileName) }
        }
        catch { throw error }
    }
    
    func fileNames() throws -> [String]? {
        do { return try fileSystem.contentsOfDirectory(atPath: documentDirectoryURL.path) }
        catch { throw error }
    }
    
    //FIXME: naming
    func all() -> [FavoriteGif] {
        var favs = [FavoriteGif]()
        guard let fileNames = try? fileNames() else { return favs }
        let decoder = JSONDecoder()
        for fileName in fileNames {
            guard let data = try? data(for: fileName) else { continue }
            guard let favoriteGif = try? decoder.decode(FavoriteGif.self, from: data) else { continue }
            favs.append(favoriteGif)
        }
        return favs
    }
}


