//
//  AppCoordinator.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/28.
//

import UIKit
import SafariServices

protocol Coordinator: AnyObject {
	var window: UIWindow { get }
	var navigationController: UINavigationController { get }
}

extension Coordinator {

	func openURL(_ urlString: String?) {
		guard let url = urlString?.toURL else { return }
		UIApplication.shared.open(url)
	}

	func toSafariWeb(_ urlString: String?) {
		guard var urlString = urlString else { return }
		if !urlString.hasPrefix("http://") && !urlString.hasPrefix("https://") {
			urlString = "http://" + urlString
		}
		guard let url = urlString.toURL else { return }
		let safariViewController = SFSafariViewController(url: url)
		navigationController.present(safariViewController, animated: true)
	}
	
}

class AppCoordinator: Coordinator {
	let window: UIWindow
	let navigationController: UINavigationController

	init(window: UIWindow) {
		self.window = window
		self.navigationController = UINavigationController()
	}

	func start() {
		let userListViewModel = UserListViewModel(coordiantor: self, client: .live)
		let userListViewController = UserListViewController(viewModel: userListViewModel)
		userListViewModel.delegate = userListViewController
		navigationController.setViewControllers([userListViewController], animated: false)
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
}



