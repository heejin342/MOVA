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
        
        let firstItem = UITabBarItem(title: "북마크", image: nil, tag: 0)
        let secondItem = UITabBarItem(title: "미정", image: nil, tag: 1)

        let firstViewCoordinator = sceneDIContainer.makeBookMarkCoordinator(parantCoordinator: self)
        childCoordinators.append(firstViewCoordinator)
        let firstViewController = firstViewCoordinator.startPush()
        firstViewController.tabBarItem = firstItem
        
        let sedcondViewCoordinator = sceneDIContainer.makeBookMarkCoordinator(parantCoordinator: self)
        childCoordinators.append(sedcondViewCoordinator)
        let secondViewController = sedcondViewCoordinator.startPush()
        secondViewController.tabBarItem = secondItem
        
        tabBarController.viewControllers = [firstViewController, secondViewController]
        return tabBarController
    }
    
}
