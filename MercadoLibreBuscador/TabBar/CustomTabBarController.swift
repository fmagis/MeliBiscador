//
//  CustomTabBarController.swift
//  MercadoLibreBuscador
//
//  Created by Francisco Caches Magis on 13/9/22.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
   
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
     
    let homeTab = CustomNavigationController()
    let homeController = HomeViewController()
      
    homeTab.viewControllers = [homeController]
    let homeNav = UITabBarItem(title: "Inicio", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
    homeTab.tabBarItem = homeNav
     
    let vc1 = UIViewController()
    let item1 = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
    vc1.view.backgroundColor = .green
    vc1.tabBarItem = item1
     
    let vc2 = UIViewController()
    let item2 = UITabBarItem(title: "Mis Compras", image: UIImage(systemName: "bag"), selectedImage: UIImage(systemName: "bag.fill"))
    vc2.view.backgroundColor = .orange
    vc2.tabBarItem = item2
     
    let vc3 = UIViewController()
    let item3 = UITabBarItem(title: "Notificaciones", image: UIImage(systemName: "bell"), selectedImage: UIImage(systemName: "bell.fill"))
    vc3.view.backgroundColor = .red
    vc3.tabBarItem = item3
     
    let vc4 = UIViewController()
    let item4 = UITabBarItem(title: "Más", image: UIImage(systemName: "ellipsis.circle"), selectedImage: UIImage(systemName: "ellipsis.circle.fill"))
    vc4.view.backgroundColor = .blue
    vc4.tabBarItem = item4
         
    self.tabBar.backgroundColor = .white
    self.viewControllers = [homeTab, vc1, vc2, vc3, vc4]
          
  }
}
