//
//  BookMarkViewModel.swift
//  MOVA
//
//  Created by 김희진 on 2022/11/08.
//

import Foundation

class BookMarkViewModel {
    var coordintor = BookMarkCoordinator()

    weak var delegate: BookMarkDelegate?
    var actions: BookMarkViewModelAction?
 
    init(actions: BookMarkViewModelAction) {
        self.actions = actions
    }
    func pushCellVC() {
        delegate?.pushCellVC()
    }
}
