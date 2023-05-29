//
//  SceneDelegate.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	private var coordinator: AppCoordinator?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = scene as? UIWindowScene else { return }

		let window = UIWindow(windowScene: windowScene)
		self.window = window
		coordinator = AppCoordinator(window: window)
		coordinator?.start()
	}
}

