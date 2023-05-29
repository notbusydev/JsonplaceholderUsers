//
//  UserListViewModel.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/28.
//

import Foundation

protocol UserListViewModelDelegate: AnyObject {
	func didFetchData(_ users: [UserViewModel])
	func didFailWithError(_ error: Error)
}

class UserListViewModel {
	private let coordiantor: UserListCoordinator
	private let client: JsonplaceholderClient

	weak var delegate: UserListViewModelDelegate?

	private var users: [User] = []

	init(coordiantor: UserListCoordinator, client: JsonplaceholderClient) {
		self.coordiantor = coordiantor
		self.client = client
	}
}

extension UserListViewModel: UserListViewModelable {

	func fetch() {
		Task {
			do {
				let users = try await client.fetchUsers()
				self.users = users
				self.delegate?.didFetchData(users.map({ UserViewModel(user: $0) }))
			} catch {
				self.delegate?.didFailWithError(error)
			}
		}
	}

	func select(indexPath: IndexPath) {

	}
}
