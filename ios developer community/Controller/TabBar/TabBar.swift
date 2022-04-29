//
//  TabBar.swift
//  ios developer community
//
//  Created by Kirill Drozdov on 28.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let newsVC      =    OurLinksViewController()
    let libraryVC   =   MaterialsViewController()

    viewControllers = [
      setUpNavigationController(title: "Новости", image: UIImage(systemName: "newspaper"), rootViewController: newsVC),
      setUpNavigationController(title: "Библиотека", image: UIImage(systemName: "book"), rootViewController: libraryVC)
    ]

      tabBar.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 0.94)
      tabBar.unselectedItemTintColor = .gray
      tabBar.tintColor = .red


  }

  private func setUpNavigationController(title: String, image: UIImage?, rootViewController: UIViewController) -> UIViewController {
    let navigationViewController = UINavigationController(rootViewController: rootViewController)
    navigationViewController.tabBarItem.image = image
    navigationViewController.tabBarItem.title = title

    return navigationViewController
  }
}
