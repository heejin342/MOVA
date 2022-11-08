//
//  TableViewCell.swift
//  MOVA
//
//  Created by 김희진 on 2022/10/31.
//

import UIKit
import SnapKit

class BookMarkTableViewCell: UITableViewCell {
    var onClick: (()->())?
    
    private lazy var thumbImage: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = .brown
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var chapterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        label.text = "SDF"
        return label
    }()
    
    lazy var seeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(selectCell), for: .touchUpInside)
        button.setTitle("보기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func selectCell() {
        onClick!()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addUI()
    }
    
    private func addUI() {
        [thumbImage, nameLabel, chapterLabel, seeButton].forEach { contentView.addSubview($0) }
        thumbImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(100)
            $0.height.equalTo(80)
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(10).priority(.high)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(thumbImage.snp.top)
            $0.leading.equalTo(thumbImage.snp.trailing).offset(10)
        }
        
        chapterLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
        
        seeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(50)
        }
    }
    
    func configureUI(item: BookModel) {
        nameLabel.text = item.name
    }
    

}


