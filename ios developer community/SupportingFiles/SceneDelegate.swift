//
//  SceneDelegate.swift
//  ios developer community
//
//  Created by Kirill Drozdov on 24.04.2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
//        window.rootViewController = MaterialsViewController()
        window.rootViewController = MainTabBarController()
//        UINavigationController(rootViewController: MaterialsViewController())
        window.makeKeyAndVisible()
        self.window = window
    }
}

