//
//  ConversationsListViewController.swift
//  Chat
//
//  Created by Akyl Mukatay  on 07.09.2023.
//

import UIKit

final class ConversationsListViewController: UIViewController {
    
    // UI
    private lazy var tableView = UITableView(frame: .zero)
    private lazy var conversationData: [ConversationCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        fillArray()
        setupTableView()
    }
    
    //MARK: Fill the array with data
    
    private func fillArray() {
        let model0 = ConversationCellModel(
            name: "Mario",
            lastMessageText: "I'm on my way. Meet me at station",
            lastMessageDate: Date(),
            isOnline: true,
            hasUnreadMessages: false
        )
        let model1 = ConversationCellModel(
            name: "Jane",
            lastMessageText: "OK",
            lastMessageDate: Date(),
            isOnline: true,
            hasUnreadMessages: true
        )
        let model2 = ConversationCellModel(
            name: "Jason",
            lastMessageText: nil,
            lastMessageDate: Date(),
            isOnline: false,
            hasUnreadMessages: true
        )
        conversationData = [model0, model1, model2]
    }
    
    //MARK: UI setup

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ConversationsListViewCell.self, forCellReuseIdentifier: "conversationsListViewCell")
    }
}

//MARK: UITableViewDataSource

extension ConversationsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return conversationData.count
        } else {
            return conversationData.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "conversationsListViewCell", for: indexPath) as? ConversationsListViewCell else {
            return UITableViewCell()
        }
        let model = conversationData[indexPath.row]
        
        cell.nameLabel.text = model.name
        if let lastMessageText = model.lastMessageText {
            cell.messageLabel.text = lastMessageText
            if model.hasUnreadMessages == false {
                cell.messageLabel.font = .systemFont(ofSize: 16, weight: .bold)
                cell.messageLabel.textColor = .black
            }
        } else {
            cell.messageLabel.text = "No messages yet"
        }
        cell.dateLabel.text = model.formattedLastMessageDate()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "ONLINE"
        } else {
            return "HISTORY"
        }
    }
}

//MARK: UITableViewDelegate

extension ConversationsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
