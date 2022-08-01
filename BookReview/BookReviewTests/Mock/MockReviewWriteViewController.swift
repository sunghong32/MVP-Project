//
//  MockReviewWriteViewController.swift
//  BookReviewTests
//
//  Created by 민성홍 on 2022/08/01.
//

import Foundation

@testable import BookReview

final class MockReviewWriteViewController: ReviewWriteProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledShowCloseAlertController = false
    var isCalledClose = false
    var isCalledSetupViews = false
    var isCalledPresentToSearchBookViewController = false
    var isCalledUpdateViews = false
    var isCalledSave = false

    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }

    func showCloseAlertController() {
        isCalledShowCloseAlertController = true
    }

    func close() {
        isCalledClose = true
    }

    func setupViews() {
        isCalledSetupViews = true
    }

    func presentToSearchBookViewController() {
        isCalledPresentToSearchBookViewController = true
    }

    func updateViews(title: String, imageURL: URL?) {
        isCalledUpdateViews = true
    }

    func save(imageURL: URL?, title: String, review: String) {
        isCalledSave = true
    }
}
