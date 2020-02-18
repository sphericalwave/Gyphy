//
//  Data.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

//  Responsibility: Decode Giphy Json into local Swift Objects

import Foundation

struct Gif: Codable, Equatable
{
    let images: Images
    let id: String  //FIXME: Naming gyphyId
    //TODO: Persist the rest of z response
    
    func url() -> URL { return images.url() }
}

//    Example Json Response
//    {
//        "type": "gif",
//        "id": "lnOG1o6Cdc3kKjuray",
//        "url": "https://giphy.com/gifs/brittany-broski-kombucha-girl-brittany-broski-lnOG1o6Cdc3kKjuray",
//        "slug": "brittany-broski-kombucha-girl-brittany-broski-lnOG1o6Cdc3kKjuray",
//        "bitly_gif_url": "https://gph.is/g/ZWdWjjz",
//        "bitly_url": "https://gph.is/g/ZWdWjjz",
//        "embed_url": "https://giphy.com/embed/lnOG1o6Cdc3kKjuray",
//        "username": "brittany_broski",
//        "source": "",
//        "title": "Yes GIF by Brittany Broski",
//        "rating": "g",
//        "content_url": "",
//        "source_tld": "",
//        "source_post_url": "",
//        "is_sticker": 0,
//        "import_datetime": "2019-10-28 15:51:49",
//        "trending_datetime": "2020-01-30 06:05:15",
//        "images":
//        "pagination":
//        "meta":
//}
