//
//  UserListViewModel.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/28.
//

import Foundation

typealias UserListCoordinator = UserDetailCoordinatable

class UserListViewModel: UserListViewModelable {
	weak var userListCoordiantor: UserListCoordinator?
	init(coordiantor: UserListCoordinator) {

	}
}


protocol UserDetailCoordinatable: AnyObject {
	func toUserDetail(_ user: User)
}
