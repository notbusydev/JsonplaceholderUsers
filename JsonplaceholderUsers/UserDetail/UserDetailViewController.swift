//
//  UserDetailViewController.swift
//  JsonplaceholderUsers
//
//  Created by JaeBin on 2023/05/30.
//

import UIKit
import MapKit

protocol UserDetailViewModelable: AnyObject {
	var name: String? { get }
	var userName: String? { get }
	var email: String? { get }
	var phone: String? { get }
	var companyDescription: String? { get }
	var website: String? { get }
	var address: String? { get }
	var location: Location? { get }

	func toEmail()
	func toCall()
	func toWebsite()
}

class UserDetailViewController: UIViewController {
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var userNameLabel: UILabel!
	@IBOutlet weak var emailButton: UIButton!
	@IBOutlet weak var phoneButton: UIButton!
	@IBOutlet weak var companyLabel: UILabel!
	@IBOutlet weak var websiteButton: UIButton!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var locationMapView: MKMapView!

	var viewModel: UserDetailViewModelable!

	override func viewDidLoad() {
        super.viewDidLoad()
		initBind()
		emailButton.addTarget(self, action: #selector(self.emailButtonTouched(sender:)), for: .touchUpInside)
		phoneButton.addTarget(self, action: #selector(self.phoneButtonTouched(sender:)), for: .touchUpInside)
		websiteButton.addTarget(self, action: #selector(self.websiteButtonTouched(sender:)), for: .touchUpInside)
    }

	fileprivate func initBind() {
		nameLabel.text = viewModel.name
		userNameLabel.text = viewModel.userName
		emailButton.setTitle(viewModel.email, for: .normal)
		phoneButton.setTitle(viewModel.phone, for: .normal)
		companyLabel.text = viewModel.companyDescription
		websiteButton.setTitle(viewModel.website, for: .normal)
		addressLabel.text = viewModel.address
		if let location = viewModel.location {
			let annotation = MKPointAnnotation()
			let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
			annotation.coordinate = coordinate
			annotation.title = viewModel.name
			locationMapView.setCenter(coordinate, animated: false)
			locationMapView.addAnnotation(annotation)
		}
	}

	@objc func emailButtonTouched(sender: UIButton) {
		viewModel.toEmail()
	}

	@objc func phoneButtonTouched(sender: UIButton) {
		viewModel.toCall()
	}

	@objc func websiteButtonTouched(sender: UIButton) {
		viewModel.toWebsite()
	}
}

struct Location {
	let latitude: Double
	let longitude: Double
}
