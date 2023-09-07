//
//  ConversationsListViewCell.swift
//  Chat
//
//  Created by Akyl Mukatay  on 07.09.2023.
//

import UIKit

final class ConversationsListViewCell: UITableViewCell {
    
    private lazy var profileImage = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var messageLabel = UILabel()
    private lazy var dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI setup
    
    private func setupUI() {
        contentView.snp.makeConstraints { make in
            make.height.equalTo(82)
        }
        
        [profileImage, nameLabel, messageLabel, dateLabel].forEach{ addSubview($0) }
        profileImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalTo(profileImage.snp.right).offset(8)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.equalTo(profileImage.snp.right).offset(8)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        profileImage.image = UIImage(named: "Lee")
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 50 / 2
        
        nameLabel.text = "Mario"
        nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        messageLabel.text = "Calls the given closure on each"
        messageLabel.textColor = .systemGray
        messageLabel.numberOfLines = 0
        
        dateLabel.text = "10:11"
        dateLabel.textColor = .systemGray
    }

}
