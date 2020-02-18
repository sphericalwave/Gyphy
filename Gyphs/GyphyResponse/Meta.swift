//
//  Meta.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import Foundation

struct Meta: Codable, Equatable
{
    let status: Int
    let msg: String
    let responseId: String
}

//"meta":
//{
//    "status": 200,
//    "msg": "OK",
//    "response_id": "4837e2a4150ac37fb3157bcef8c9421364b1907d"
//}
