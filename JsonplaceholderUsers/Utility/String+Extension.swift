//
//  Extension+String.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/30.
//

import Foundation

extension String {
	var toURL: URL? {
		URL(string: self)
	}
}
