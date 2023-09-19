//
//  ConversationViewController.swift
//  Chat
//
//  Created by Akyl Mukatay  on 11.09.2023.
//

import UIKit

class ConversationViewController: UIViewController {
    
    private var conversationPartner: ConversationCellModel?
    private var sendTextView = UIView()
    private var textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        if let partner = conversationPartner {
//            self.title = partner.name
//
//            let avatarImageView = UIImageView(image: UIImage(named: partner.profileImage ?? "Lee"))
//            avatarImageView.contentMode = .scaleAspectFit
//            self.navigationItem.titleView = avatarImageView
//        }
        
        configure()
    }
    
    func configure() {
        let avatarImage = UIImageView(image: UIImage(named: "Lee"))
        avatarImage.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.layer.cornerRadius = 20
        avatarImage.clipsToBounds = true
        self.navigationItem.titleView = avatarImage
        
        view.addSubview(sendTextView)
        sendTextView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(32)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        sendTextView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
        textField.placeholder = "Type message"
        textField.borderStyle = .roundedRect
    }
}
