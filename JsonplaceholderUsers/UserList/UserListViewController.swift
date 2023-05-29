//
//  UserListViewController.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/26.
//

import UIKit

protocol UserListViewModelable {

}

class UserListViewController: UIViewController {

	private let collectionView: UICollectionView = {
		let flowlayout = UICollectionViewFlowLayout()
		flowlayout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectionView.backgroundColor = .white
		return collectionView
	}()

	init(viewModel: UserListViewModelable) {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	override func loadView() {
		view = collectionView
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Users"
	}
}
