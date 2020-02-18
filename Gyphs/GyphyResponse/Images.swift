//
//  Images.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import Foundation

struct Images: Codable, Equatable
{
    let original: OriginalImage
    
    func url() -> URL {
        return original.url
    }
}

//"images":
//   {
//       "downsized_large":
//       "fixed_height_small_still":
//       "original":
//       "fixed_height_downsampled":
//       "downsized_still":
//       "fixed_height_still":
//       "downsized_medium":
//       "downsized":
//       "preview_webp":
//       "original_mp4":
//       "fixed_height_small":
//       "fixed_height":
//       "downsized_small":
//       "fixed_width_downsampled":
//       "fixed_width_small_still":
//       "fixed_width_small":
//       "original_still":
//       "fixed_width_still":
//       "looping":
//       "fixed_width":
//       "preview_gif":
//       "480w_still":
