//
//  CollectionScreenData.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class TrendingScreenData
{
    let diffableData: UICollectionViewDiffableDataSource<Section, LocalGif>
    let gyphyURL: GyphyUrl
    let gifsScreen: GifCollection
    
    init(gyphyURL: GyphyUrl, gifsScreen: GifCollection, favorites: FavoriteGifs) {
        self.gyphyURL = gyphyURL
        self.gifsScreen = gifsScreen
        self.diffableData = UICollectionViewDiffableDataSource<Section, LocalGif>(collectionView: gifsScreen.collectionView) {
            (collectionView, indexPath, gif) -> UICollectionViewCell? in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GifCell.cellId, for: indexPath) as? GifCell else { fatalError() }//FIXME: Remove Static
                let gifPlayer = GifPlayer(bounds: cell.contentView.bounds, gif: gif, favorites: favorites)
                gifsScreen.embed(viewController: gifPlayer, inContainerView: cell.contentView)
                cell.gifPlayer = gifPlayer  //FIXME: Be Immutable, this is gross
                return cell
        }
    }
    
    func start() {
        let url = gyphyURL.url()    //FIXME: Naming
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let gyphyResponseDownload = session.dataTask(with: request) { data, response, error in
            do {
                guard let data = data else { return }  //TODO: Show No Network Connection
                let gyphyResponse = try decoder.decode(GyphyResponse.self, from: data)
                var snapshot = NSDiffableDataSourceSnapshot<Section, LocalGif>() //FIXME: Be Immutable
                let gifs = gyphyResponse.gifs
                var localGifs = [LocalGif]()    //FIXME: Vars
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
