//
//  BookMarkCoordinator.swift
//  MOVA
//
//  Created by 김희진 on 2022/10/31.
//

import Foundation
import UIKit

class BookMarkCoordinator: Coordinator, BookMarkDelegate {

    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = .init()
    }
    
    func start() {
        
    }
    
    func startPush() -> UINavigationController {
        let firstViewController = BookMarkListViewController()
        firstViewController.delegate = self
        firstViewController.view.backgroundColor = .white
        firstViewController.navigationItem.title = "볼거 리스트"
        navigationController.setViewControllers([firstViewController], animated: false)
        return navigationController
    }

    
    func pushCellVC() {
        let vc = ThridViewCoordinator(navigationController: navigationController)
        vc.parentCoordinator = self
        childCoordinators.append(vc)
        vc.start()
    }

}
