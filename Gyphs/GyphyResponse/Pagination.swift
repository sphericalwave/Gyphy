//
//  Pagination.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import Foundation

struct Pagination: Codable, Equatable
{
    let totalCount: Int
    let count: Int
    let offset: Int
}

//"pagination":
//{
//    "total_count": 90290,
//    "count": 1,
//    "offset": 0
//},
