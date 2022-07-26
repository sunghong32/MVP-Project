//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 민성홍 on 2022/07/20.
//

import UIKit

protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

final class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol

    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }

    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }

    func viewWillAppear() {
        viewController.reloadTableView()
    }

    func didTapRightBarButtonItem() {
        viewController.presentToReviewWriteViewController()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "\(indexPath)"

        return cell
    }
}
