//
//  Coordinator.swift
//  MOVA
//
//  Created by 김희진 on 2022/10/31.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

