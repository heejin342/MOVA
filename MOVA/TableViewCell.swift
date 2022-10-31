//
//  TableViewCell.swift
//  MOVA
//
//  Created by 김희진 on 2022/10/31.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addUI()
    }
    
    private func addUI() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
}
