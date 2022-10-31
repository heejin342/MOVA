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

    weak var coordinator: Coordinator?
    private weak var titleLabel: UILabel!
    private weak var button: UIButton!
    
    weak var delegate: BookMarkDelegate?
    
    private lazy var bookmarkListTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
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
    }
    
    func setupUI() {
        [bookmarkListTableView].forEach { view.addSubview($0) }
        bookmarkListTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension BookMarkListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = "SDf"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.pushCellVC()
    }
}

