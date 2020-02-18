//
//  Search.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

enum Section: CaseIterable { case main }

class Search
{
    let gyphyURL: GyphyUrl
    let diffableData: UICollectionViewDiffableDataSource<Section, LocalGif>
    let searchEngine: SearchEngine
    
    init(gyphyURL: GyphyUrl, diffableData: UICollectionViewDiffableDataSource<Section, LocalGif>, searchEngine: SearchEngine) {
        self.gyphyURL = gyphyURL
        self.diffableData = diffableData
        self.searchEngine = searchEngine
    }
    
    func execute() {
        let request = URLRequest(url: gyphyURL.url())
        let session = URLSession.shared
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let gyphyResponseDownload = session.dataTask(with: request) { data, response, error in
            do {
                DispatchQueue.main.async { self.searchEngine.endSearch() }
                guard let data = data else { return }  //FIXME: Show No Network Connection
                let gyphyResponse = try decoder.decode(GyphyResponse.self, from: data)
                var snapshot = NSDiffableDataSourceSnapshot<Section, LocalGif>() //FIXME: Be Immutable
                let gifs = gyphyResponse.gifs
                var localGifs = [LocalGif]()    //FIXME: Be Immutable
                for gif in gifs { localGifs.append(LocalGif(gif: gif)) }
                snapshot.appendSections([.main])
                snapshot.appendItems(localGifs)
                self.diffableData.apply(snapshot, animatingDifferences: true, completion: nil)
            }
            catch {
                print(error.localizedDescription)
                fatalError()
            }
        }
        gyphyResponseDownload.resume()
    }
}
