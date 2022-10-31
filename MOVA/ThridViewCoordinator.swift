//
//  ThridViewCoordinator.swift
//  MOVA
//
//  Created by 김희진 on 2022/10/31.
//

import Foundation
import UIKit

class ThridViewCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.navigationController.pushViewController(UIViewController(), animated: true)
    }
        
}
