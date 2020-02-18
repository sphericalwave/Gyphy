//
//  UIViewController+Extensions.swift
//  FoodConstruction
//
//  Created by Aaron Anthony on 2018-04-17.
//  Copyright © 2018 Aaron Anthony. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupViewLayoutConstraints(viewController: UIViewController, rect: CGRect) -> UIView {
        guard let newView = viewController.view else { fatalError() }
        newView.translatesAutoresizingMaskIntoConstraints = true
        newView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        newView.frame = rect
        return newView
    }
    
    //FIXME: rename inContainerView to "in containerView"
    func embed(viewController: UIViewController, inContainerView: UIView) {
        self.addChild(viewController)
        let newView = setupViewLayoutConstraints(viewController: viewController, rect: inContainerView.bounds)
        inContainerView.addSubview(newView)
        viewController.didMove(toParent: self)
    }
}
