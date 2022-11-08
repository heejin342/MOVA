//
//  BookMarkListViewController.swift
//  MOVA
//
//  Created by 김희진 on 2022/10/31.
//

import UIKit
import SnapKit

protocol BookMarkDelegate: AnyObject {
    func pushCellVC()
}

class BookMarkListViewController: UIViewController {

    private weak var titleLabel: UILabel!
    private weak var button: UIButton!
    
    var viewModel: BookMarkViewModel?
    var dataSource: UITableViewDiffableDataSource<Int, BookModel>?
    
    private lazy var bookmarkListTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.register(BookMarkTableViewCell.self, forCellReuseIdentifier: "BookMarkTableViewCell")
        return tableView
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var filter: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindUI()
    }
    
    func setupUI() {
        [bookmarkListTableView].forEach { view.addSubview($0) }
        bookmarkListTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bindUI() {
        
        dataSource = UITableViewDiffableDataSource(tableView: bookmarkListTableView, cellProvider: { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookMarkTableViewCell", for: indexPath) as! BookMarkTableViewCell
            cell.configureUI(item: item)
            cell.onClick = {
                self.viewModel?.pushCellVC()
            }
            return cell
        })
                
        var snapshot = dataSource?.snapshot()
        snapshot?.appendSections([0])
        snapshot?.appendItems([BookModel(id: 0, name: "책ㅂ", url: ""),
                              BookModel(id: 1, name: "책2", url: "ㄴㄴㅇㄹ")], toSection: 0)
                
        dataSource?.apply(snapshot!, animatingDifferences: false)
    }

}

extension BookMarkListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


