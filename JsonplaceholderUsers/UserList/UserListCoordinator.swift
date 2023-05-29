//
//  Coordinator+UserList.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/30.
//

import Foundation

protocol UserListCoordinator: AnyObject {
	func toUserDetail(_ user: User)
}

extension AppCoordinator: UserListCoordinator {
	func toUserDetail(_ user: User) {
		let userDetailViewController = UserDetailViewController()
		userDetailViewController.viewModel = UserDetailViewModel(user: user, coordinator: self)
		navigationController.pushViewController(userDetailViewController, animated: true)
	}
}
