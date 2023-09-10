//
//  ConversationsListViewCell.swift
//  Chat
//
//  Created by Akyl Mukatay  on 07.09.2023.
//

import UIKit

final class ConversationsListViewCell: UITableViewCell, ConfigurableViewProtocol {

    typealias ConfigurationModel = ConversationCellModel

    lazy var profileImage = UIImageView()
    lazy var nameLabel = UILabel()
    lazy var messageLabel = UILabel()
    lazy var dateLabel = UILabel()
    private lazy var dateStack = UIStackView()
    private lazy var rightIcon = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
//        profileImage.image = nil
        nameLabel.text = nil
        messageLabel.text = nil
        dateLabel.text = nil
    }
    
    func configure(with model: ConversationCellModel) {
        
    }
    
    
    //MARK: UI setup
    
    private func setupUI() {
        contentView.snp.makeConstraints { make in
            make.height.equalTo(72)
        }
        
        [profileImage, nameLabel, messageLabel, dateStack].forEach{ addSubview($0) }
        profileImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(13)
            make.left.equalTo(profileImage.snp.right).offset(8)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.equalTo(profileImage.snp.right).offset(8)
        }
        dateStack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(13)
            make.right.equalToSuperview().inset(16)
        }
        
        profileImage.image = UIImage(named: "Lee")
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 50 / 2
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        messageLabel.textColor = .systemGray
        messageLabel.numberOfLines = 0
        
        dateStack.addArrangedSubview(dateLabel)
        dateStack.addArrangedSubview(rightIcon)
        dateStack.spacing = 4
        dateLabel.text = "10:11"
        dateLabel.textColor = .systemGray
        dateLabel.font = .systemFont(ofSize: 16)
        rightIcon.image = UIImage(named: "chevron-right")
        rightIcon.tintColor = .systemGray
    }

}
