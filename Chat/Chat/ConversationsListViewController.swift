//
//  ConversationsListViewController.swift
//  Chat
//
//  Created by Akyl Mukatay  on 07.09.2023.
//

import UIKit

final class ConversationsListViewController: UIViewController {
    
    private lazy var tableView = UITableView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTableView()
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "conversationsListViewCell", for: indexPath) as? ConversationsListViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

//MARK: UITableViewDelegate

extension ConversationsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
