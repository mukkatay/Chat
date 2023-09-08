//
//  ConversationsListViewController.swift
//  Chat
//
//  Created by Akyl Mukatay  on 07.09.2023.
//

import UIKit

//enum Section: Hashable, CaseIterable {
//    case section1
//    case section2
//}
//
//struct Item: Hashable {
//    let id = UUID()
//    let name: String
//}

final class ConversationsListViewController: UIViewController {
    
    // UI
    private lazy var tableView = UITableView(frame: .zero)
//    private var data1: [Item] = []
//    private var data2: [Item] = []
    
    // Model
//    private lazy var dataSource = DataSource(tableView)
    
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
        if section == 0 {
            return 5
        } else {
            return 3
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "conversationsListViewCell", for: indexPath) as? ConversationsListViewCell else {
            return UITableViewCell()
        }
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
