//
//  JsonplaceholderClient.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/30.
//

import Foundation

struct JsonplaceholderClient {
	var fetchUsers: () async throws -> UsersResponse
}

extension JsonplaceholderClient {
	static var live: Self {
		let network = Network(Constant.jsonPlaceholderDomain)
		return JsonplaceholderClient(fetchUsers: {
			try await network.get(path: "/users", type: UsersResponse.self)
		})
	}
}
