//
//  MockReviewListViewController.swift
//  BookReviewTests
//
//  Created by 민성홍 on 2022/08/01.
//

import Foundation

@testable import BookReview

final class MockReviewListViewController: ReviewListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupViews = false
    var isCalledPresentToReviewWriteViewController = false
    var isCalledReloadTableView = false

    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }

    func setupViews() {
        isCalledSetupViews = true
    }

    func presentToReviewWriteViewController() {
        isCalledPresentToReviewWriteViewController = true
    }

    func reloadTableView() {
        isCalledReloadTableView = true
    }
}
