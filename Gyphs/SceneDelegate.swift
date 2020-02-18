//
//  SceneDelegate.swift
//  Gyphs
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2019 SphericalWaveSoftware. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate
{
    var window: UIWindow?
    let favorites = FavoriteGifs()
    let apiKey = "neYTrWXXDuHgHWqtlrH1vmjI6FGyQUi8"

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow.init(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = GyphsApp(apiKey:apiKey, favorites: favorites)
        window?.makeKeyAndVisible()
    }

    //TODO: Handle App Lifecycle
    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
}

