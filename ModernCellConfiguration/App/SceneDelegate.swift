//
//  SceneDelegate.swift
//  ModernCellConfiguration
//
//  Created by Dmitry Dorodniy on 25.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let viewController = CollectionListViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

