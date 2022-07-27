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
    func presentToSearchBookViewController()
    func updateViews(title: String, imageURL: URL?)
    func save(imageURL: URL?, title: String, review: String)
}

protocol WriteReviewDelegate {
    func saveComment(comment: String)
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol

    private let userDefaultsManager = UserDefaultsManager()

    private var book: Book?

    let contentsTextViewPlaceHolderText = "내용을 입력해주세요."

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

    func didTapRightBarButton(contentsText: String?) {
        guard let book = book,
              let contentsText = contentsText,
              contentsText != contentsTextViewPlaceHolderText else { return }

        let review = Review(title: book.title, contents: contentsText, imageURL: book.imageURL)

        userDefaultsManager.setReview(review)
        viewController.close()
    }

    func didTapBookTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectBook(_ book: Book) {
        self.book = book
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
