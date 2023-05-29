//
//  UserListViewController.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/26.
//

import UIKit

protocol UserListViewModelable {
	func fetch()
	func select(indexPath: IndexPath)
}

class UserListViewController: UIViewController {

	private let tableView: UITableView = {
		let tableView = UITableView(frame: .zero, style: .grouped)
		return tableView
	}()

	private let retryView = RetryView(frame: .zero)
	private let refreshControl = UIRefreshControl()

	private let viewModel: UserListViewModelable
	private var userViewModels: [UserViewModel] = []

	init(viewModel: UserListViewModelable) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

	override func loadView() {
		view = tableView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "User List"
		tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
		tableView.backgroundView = retryView
		tableView.delegate = self
		tableView.dataSource = self
		tableView.refreshControl = refreshControl
		refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
		
		retryView.onRetry = { [weak self] in
			self?.viewModel.fetch()
		}
		viewModel.fetch()
	}
	@objc func refresh(_ sender: UIRefreshControl) {
		viewModel.fetch()
	}
}

extension UserListViewController: UserListViewModelDelegate {
	func didFetchData(_ users: [UserViewModel]) {
		self.userViewModels = users
		DispatchQueue.main.async {
			self.tableView.reloadData()
			if !self.retryView.isHidden {
				self.retryView.isHidden = true
			}
			self.refreshControl.endRefreshing()
		}
	}

	func didFailWithError(_ error: Error) {
		DispatchQueue.main.async {
			self.retryView.isHidden = false
			self.refreshControl.endRefreshing()
		}
	}
}

extension UserListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}

extension UserListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return userViewModels.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
		let viewModel = userViewModels[indexPath.row]
		cell.bind(viewModel)
		return cell
	}
}

