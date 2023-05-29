//
//  UserDetailViewModel.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/30.
//

import Foundation

class UserDetailViewModel  {
	private let user: User
	private let coordinator: Coordinator
	init(user: User, coordinator: Coordinator) {
		self.user = user
		self.coordinator = coordinator
	}
}

extension UserDetailViewModel: UserDetailViewModelable {
	var name: String? {
		user.name
	}

	var userName: String? {
		user.username
	}

	var email: String? {
		user.email
	}

	var phone: String? {
		user.phone
	}

	var companyDescription: String? {
		user.company.name
	}

	var website: String? {
		user.website
	}

	var address: String? {
		user.address.fullAddress
	}

	var location: Location? {
		guard let lat = user.address.geo.lat.toDouble, let lng = user.address.geo.lng.toDouble else { return nil }
		return Location(latitude: lat, longitude: lng)
	}

	func toEmail() {
		guard let email = self.email else { return }
		coordinator.openURL("mailto:\(email)")
	}

	func toCall() {
		guard let phone = self.phone else { return }
		coordinator.openURL("tel:\(phone)")
	}

	func toWebsite() {
		coordinator.toSafariWeb(website)
	}
}
