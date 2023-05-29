//
//  CollectionViewCell.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/30.
//

import UIKit

class UserViewModel {
	let name: String
	let userName: String
	let email: String

	init(user: User) {
		self.name = user.name
		self.userName = "(\(user.username))"
		self.email = user.email
	}
}

class UserTableViewCell: UITableViewCell {

	private let nameLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.font = .systemFont(ofSize: 18, weight: .medium)
		view.text = "name"
		view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
		return view
	}()
	
	private let userNameLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.font = .systemFont(ofSize: 18)
		view.text = "userName"
		return view
	}()

	private let emailLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.font = .systemFont(ofSize: 14)
		view.text = "email"
		return view
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		contentView.addSubview(nameLabel)
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
		])

		contentView.addSubview(userNameLabel)

		NSLayoutConstraint.activate([
			userNameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
			userNameLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
			userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
		])

		contentView.addSubview(emailLabel)
		NSLayoutConstraint.activate([
			emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
			emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			emailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
		])
	}

	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

	func bind(_ viewModel: UserViewModel) {
		self.nameLabel.text = viewModel.name
		self.userNameLabel.text = viewModel.userName
		self.emailLabel.text = viewModel.email
	}
}
