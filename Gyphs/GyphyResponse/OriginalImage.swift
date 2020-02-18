//
//  OriginalSmallImage.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import Foundation

struct OriginalImage: Codable, Equatable
{
    let url: URL
}

//       "original":
//       {
//           "frames": "61",
//           "hash": "f4459874959cf081b1815f9551d50e2f",
//           "height": "360",
//           "mp4": "https://media2.giphy.com/media/lnOG1o6Cdc3kKjuray/giphy.mp4?cid=ff71a59d4837e2a4150ac37fb3157bcef8c9421364b1907d&rid=giphy.mp4",
//           "mp4_size": "383439",
//           "size": "4313017",
//           "url": "https://media2.giphy.com/media/lnOG1o6Cdc3kKjuray/giphy.gif?cid=ff71a59d4837e2a4150ac37fb3157bcef8c9421364b1907d&rid=giphy.gif",
//           "webp": "https://media2.giphy.com/media/lnOG1o6Cdc3kKjuray/giphy.webp?cid=ff71a59d4837e2a4150ac37fb3157bcef8c9421364b1907d&rid=giphy.webp",
//           "webp_size": "624414",
//           "width": "480"
//       },
