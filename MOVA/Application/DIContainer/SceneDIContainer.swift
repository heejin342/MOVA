//
//  SceneDIContainer.swift
//  MOVA
//
//  Created by 김희진 on 2022/11/01.
//

import Foundation

final class SceneDIContainer {
    func makeBookMarkCoordinator(parantCoordinator: Coordinator, bookDIContainer: BookDIContainter) -> BookMarkCoordinator {
        let bookMarkVC = BookMarkCoordinator()
        bookMarkVC.parentCoordinator = parantCoordinator
        bookMarkVC.bookDIContainer = bookDIContainer
        return bookMarkVC
    }
}
