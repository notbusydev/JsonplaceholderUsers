//
//  Network.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/30.
//

import Foundation

class Network {
	private let domainName: String
	init(_ domainName: String) {
		self.domainName = domainName
	}

	func get<T: Decodable>(path: String, type: T.Type) async throws -> T {
		let urlString = domainName + path
		guard let url = urlString.toURL else { throw URLError(.badURL)}

		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		let (data, _) = try await URLSession.shared.data(for: request)
		let users = try JSONDecoder().decode(T.self, from: data)

		return users
	}
}
