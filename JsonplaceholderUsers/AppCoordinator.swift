//
//  AppCoordinator.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/28.
//

import UIKit

protocol Coordinator: AnyObject {
	var window: UIWindow { get }
	var navigationController: UINavigationController { get }
}

class AppCoordinator: Coordinator {
	let window: UIWindow
	let navigationController: UINavigationController

	init(window: UIWindow) {
		self.window = window
		self.navigationController = UINavigationController()
	}

	func start() {
		let userListViewModel = UserListViewModel(coordiantor: self)
		let userListViewController = UserListViewController(viewModel: userListViewModel)
		navigationController.setViewControllers([userListViewController], animated: false)
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
}


extension AppCoordinator: UserListCoordinator {
	func toUserDetail(_ user: User) {

	}
}
