//
//  ProfileViewController.swift
//  Chat
//
//  Created by Akyl Mukatay  on 07.09.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate {
    
    private let roundView = UIView()
    private let profileImageView = UIImageView()
    private let addPhotoButton = UIButton()
    private let nameLabel = UILabel()
    private let bioLabel = UILabel()
    private let countryLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "My Profile"
        
        configureLayout()
        configure()
    }
    
    
    func configureLayout() {
        [roundView, addPhotoButton, nameLabel, bioLabel, countryLabel].forEach {
            view.addSubview($0)
        }
        
        roundView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(96)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(160)
        }
        addPhotoButton.snp.makeConstraints {
            $0.top.equalTo(roundView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(addPhotoButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        bioLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        countryLabel.snp.makeConstraints {
            $0.top.equalTo(bioLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configure() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Close",
            style: .plain,
            target: self,
            action: #selector(closeButtonTapped)
        )
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(editButtonTapped)
        )
        
        roundView.backgroundColor = .systemPink
        roundView.layer.cornerRadius = 160 / 2
        
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 160 / 2
        
        addPhotoButton.setTitle("Add Photo", for: .normal)
        addPhotoButton.setTitleColor(.systemBlue, for: .normal)
        addPhotoButton.setTitleColor(.lightGray, for: .highlighted)
        addPhotoButton.addTarget(self, action: #selector(addPhotoButtonTapped), for: .touchUpInside)
        
        nameLabel.text = "Mario Steele"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 21)
        
        bioLabel.text = "Millionaire, philantrop, traveler, life explorer"
        bioLabel.textColor = .systemGray
        
        countryLabel.text = "Almaty, Kazakhstan"
        countryLabel.textColor = .systemGray
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc func editButtonTapped() {
        print("edit button tapped")
    }
    
    @objc func addPhotoButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
        
        roundView.addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(160)
        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.image = selectedImage
            picker.dismiss(animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

