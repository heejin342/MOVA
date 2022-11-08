//
//  BookDIContainer.swift
//  MOVA
//
//  Created by 김희진 on 2022/11/08.
//

import Foundation

struct BookMarkViewModelAction {
    let didSelectCell: (BookModel) -> Void
}

class BookDIContainter {
    func makeBookMarkListViewController(coordinator: BookMarkCoordinator, actions: BookMarkViewModelAction) -> BookMarkListViewController {
        let firstViewController = BookMarkListViewController()

        let viewModel = makeBookMarkViewModel(actions: actions)
        viewModel.delegate = coordinator
        firstViewController.viewModel = viewModel
        
        return firstViewController
    }
    
    func makeBookMarkViewModel(actions: BookMarkViewModelAction) -> BookMarkViewModel {
        return BookMarkViewModel(actions: actions)
    }
}
