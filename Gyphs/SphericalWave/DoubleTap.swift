//
//  DoubleTap.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class DoubleTap: UITapGestureRecognizer
{
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        self.numberOfTapsRequired = 2  // add double tap
        self.delaysTouchesBegan = true
        self.cancelsTouchesInView = true
    }
}
