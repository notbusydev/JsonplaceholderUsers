//
//  RetryView.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/30.
//

import UIKit

class RetryView: UIView {
	private let retryButton: UIButton = {
		let button = UIButton(type: .custom)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("재시도", for: .normal)
		button.setTitleColor(.red, for: .normal)
		return button
	}()

	private let descriptionLabel: UILabel = {
		let view = UILabel()
		view.text = "오류가 발생하였습니다."
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	var onRetry: (() -> Void)?

	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(retryButton)
		NSLayoutConstraint.activate([
			retryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			retryButton.centerYAnchor.constraint(equalTo: centerYAnchor)
		])

		addSubview(descriptionLabel)

		NSLayoutConstraint.activate([
			descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			descriptionLabel.bottomAnchor.constraint(equalTo: retryButton.topAnchor, constant: -10)
		])

		retryButton.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
	}



	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	@objc func retryButtonTapped() {
		onRetry?()
	}
}
