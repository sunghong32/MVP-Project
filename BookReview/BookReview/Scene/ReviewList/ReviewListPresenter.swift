//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 민성홍 on 2022/07/20.
//

import UIKit
import Kingfisher

protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

final class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol

    private let userDefaultsManager: UserDefaultsManagerProtocol

    private var review: [Review] = []

    init(viewController: ReviewListProtocol,
         userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }

    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }

    func viewWillAppear() {
        review = userDefaultsManager.getReviews()
        viewController.reloadTableView()
    }

    func didTapRightBarButtonItem() {
        viewController.presentToReviewWriteViewController()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        review.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let review = review[indexPath.row]
        cell.textLabel?.text = review.title
        cell.detailTextLabel?.text = review.contents
        cell.imageView?.kf.setImage(with: review.imageURL, placeholder: .none, completionHandler: { _ in
            cell.setNeedsLayout()
        })

        cell.selectionStyle = .none

        return cell
    }
}

extension ReviewListPresenter: WriteReviewDelegate {
    func saveComment(comment: String) {
        
    }
}
