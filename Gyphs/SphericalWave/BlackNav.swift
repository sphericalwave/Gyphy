//
//  Nav.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class BlackNav: UINavigationController
{
    init(screen: UIViewController) {
        super.init(rootViewController: screen)
        navigationBar.barStyle = .black
        navigationBar.isTranslucent = false
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
}
