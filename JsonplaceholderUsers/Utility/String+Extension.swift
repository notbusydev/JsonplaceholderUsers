//
//  Extension+String.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/30.
//

import Foundation

extension String {
	var toURL: URL? {
		if let urlString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
			return URL(string: urlString)
		} else {
			return URL(string: self)
		}
	}

	var toDouble: Double? {
		Double(self)
	}
}
