//
//  ConversationViewController.swift
//  Chat
//
//  Created by Akyl Mukatay  on 11.09.2023.
//

import UIKit

class ConversationViewController: UIViewController {
    
    var conversationPartner: ConversationCellModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let partner = conversationPartner {
            self.title = partner.name
            
            let avatarImageView = UIImageView(image: UIImage(named: partner.profileImage ?? "Lee"))
            avatarImageView.contentMode = .scaleAspectFit
            self.navigationItem.titleView = avatarImageView
        }
        
        
    }
}
