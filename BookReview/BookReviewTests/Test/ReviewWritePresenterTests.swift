//
//  ReviewWritePresenterTests.swift
//  BookReviewTests
//
//  Created by 민성홍 on 2022/08/01.
//

import XCTest

@testable import BookReview

class ReviewWritePresenterTests: XCTestCase {
    var sut: ReviewWritePresenter!
    var viewController: MockReviewWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!

    override func setUp() {
        super.setUp()

        viewController = MockReviewWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()
        sut = ReviewWritePresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager
        )
    }

    override func tearDown() {
        sut = nil
        viewController = nil
        userDefaultsManager = nil

        super.tearDown()
    }

    func test_viewDidLoad가_호출될_때() {
        sut.viewDidLoad()

        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }

    func test_didTapLeftBarButton이_호출될_때() {
        sut.didTapLeftBarButton()

        XCTAssertTrue(viewController.isCalledShowCloseAlertController)
    }

    func test_didTapRightBarButton이_호출될_때_book이_존재하지않으면() {
        sut.book = nil
        sut.didTapRightBarButton(contentsText: "참 공부하기 좋은 책이에요.")

        XCTAssertFalse(userDefaultsManager.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }

    func test_didTapRightBarButton이_호출될_때_book이_존재하고_contentsText가_존재하지않으면() {
        sut.book = Book(title: "Swift", imagURL: "")
        sut.didTapRightBarButton(contentsText: nil)

        XCTAssertFalse(userDefaultsManager.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }

    func test_didTapRightBarButton이_호출될_때_book이_존재하고_contentsText가_와같으면() {
        sut.book = Book(title: "Swift", imagURL: "")
        sut.didTapRightBarButton(contentsText: sut.contentsTextViewPlaceHolderText)

        XCTAssertFalse(userDefaultsManager.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }

    func test_didTapRightBarButton이_호출될_때_book이_존재하고_contentsText가_placeHolder와_같지않게_존재하면() {
        sut.book = Book(title: "Swift", imagURL: "")
        sut.didTapRightBarButton(contentsText: "참 공부하기 좋은 책이에요.")

        XCTAssertTrue(userDefaultsManager.isCalledSetReviews)
        XCTAssertTrue(viewController.isCalledClose)
    }

    func test_didTapBookTitleButton이_호출될_때() {
        sut.didTapBookTitleButton()

        XCTAssertTrue(viewController.isCalledPresentToSearchBookViewController)
    }
}


