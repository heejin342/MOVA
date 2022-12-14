//
//  AppCoordinator.swift
//  MOVA
//
//  Created by 김희진 on 2022/10/31.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let window: UIWindow?
    var sceneDIContainer: SceneDIContainer
    
    init(_ window: UIWindow?) {
        self.window = window
        sceneDIContainer = SceneDIContainer()
        window?.makeKeyAndVisible()
    }
    
    func start() {
        let tabBarController = setTabBarController()
        self.window?.rootViewController = tabBarController
    }
    
    func setTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.selectedIndex = 0
        let firstItem = UITabBarItem(title: "북마크", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark.fill"))
        let secondItem = UITabBarItem(title: "미정", image: nil, tag: 1)

        let firstViewCoordinator = sceneDIContainer.makeBookMarkCoordinator(parantCoordinator: self, bookDIContainer: BookDIContainter())
        childCoordinators.append(firstViewCoordinator)
        let firstViewController = firstViewCoordinator.startPush()
        firstViewController.tabBarItem = firstItem
        
        let sedcondViewCoordinator = sceneDIContainer.makeBookMarkCoordinator(parantCoordinator: self, bookDIContainer: BookDIContainter())
        childCoordinators.append(sedcondViewCoordinator)
        let secondViewController = sedcondViewCoordinator.startPush()
        secondViewController.tabBarItem = secondItem
        
        tabBarController.viewControllers = [firstViewController, secondViewController]
        return tabBarController
    }
    
}
