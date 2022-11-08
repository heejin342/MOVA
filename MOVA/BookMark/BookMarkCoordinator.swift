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
    var bookDIContainer: BookDIContainter?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = .init()
    }
    
    func start() {
        
    }
    
    func startPush() -> UINavigationController {
        let firstViewController = bookDIContainer?.makeBookMarkListViewController(coordinator: self, actions: BookMarkViewModelAction(didSelectCell: didSelectCell))

        guard let firstViewController = firstViewController else { return UINavigationController() }
        firstViewController.view.backgroundColor = .white
        firstViewController.navigationItem.title = "볼거 리스트"
        navigationController.setViewControllers([firstViewController], animated: false)
        return navigationController
    }

    func didSelectCell(_ bookItem: BookModel) {
        print("DFSDKF")
    }
    
    func pushCellVC() {
        let vc = ThridViewCoordinator(navigationController: navigationController)
        vc.parentCoordinator = self
        childCoordinators.append(vc)
        vc.start()
    }

    
    func push() {
        let vc = ThridViewCoordinator(navigationController: navigationController)
        vc.parentCoordinator = self
        childCoordinators.append(vc)
        vc.start()
    }

}
