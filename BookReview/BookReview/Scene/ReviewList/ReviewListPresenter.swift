//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 민성홍 on 2022/07/20.
//

import Foundation

protocol ReviewListProtocol {

}

final class ReviewListPresenter {
    private let viewController: ReviewListProtocol

    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }

    func print() {
        Swift.print("------")
    }
}
