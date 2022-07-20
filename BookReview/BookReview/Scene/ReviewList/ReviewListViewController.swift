//
//  ReviewListViewController.swift
//  BookReview
//
//  Created by 민성홍 on 2022/07/20.
//

import UIKit

final class ReviewListViewController: UIViewController {
    private lazy var presenter = ReviewListPresenter(viewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.print()
    }
}

extension ReviewListViewController: ReviewListProtocol {

}

