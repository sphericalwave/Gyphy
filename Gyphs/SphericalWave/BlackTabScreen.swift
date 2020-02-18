//
//  BlackTabScreen.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class BlackTabScreen: UITabBarController
{
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBar.barStyle = .black
        tabBar.isTranslucent = false
        selectedIndex = 0
    }
    required init?(coder: NSCoder) { fatalError() }
}
