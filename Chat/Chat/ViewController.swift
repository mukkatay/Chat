//
//  ViewController.swift
//  Chat
//
//  Created by Akyl Mukatay  on 06.09.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configureStyle()
    }

    func configureLayout() {
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func configureStyle() {
        button.setTitle("Show Profile", for: .normal)
        button.addTarget(self, action: #selector(showProfileTapped), for: .touchUpInside)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
    }
    
    @objc func showProfileTapped() {
        let profileViewController = ProfileViewController()
        let navigationViewController = UINavigationController(rootViewController: profileViewController)
        present(navigationViewController, animated: true)
    }
}

