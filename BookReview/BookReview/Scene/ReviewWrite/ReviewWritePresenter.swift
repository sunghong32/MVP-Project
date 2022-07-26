//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by 민성홍 on 2022/07/25.
//

import Foundation

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func showCloseAlertController()
    func close()
    func setupViews()
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol

    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }

    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }

    func didTapLeftBarButton() {
        viewController.showCloseAlertController()
    }

    func didTapRightBarButton() {
        viewController.close()
    }
}