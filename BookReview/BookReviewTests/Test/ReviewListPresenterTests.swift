//
//  ReviewListPresenterTests.swift
//  ReviewListPresenterTests
//
//  Created by 민성홍 on 2022/07/20.
//

import XCTest
@testable import BookReview

class ReviewListPresenterTests: XCTestCase {
    var sut: ReviewListPresenter!
    var viewController: MockReviewListViewController!
    var userDefaultsManager: MockUserDefaultsManager!

    override func setUp() {
        super.setUp()

        viewController = MockReviewListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        sut = ReviewListPresenter(viewController: viewController, userDefaultsManager: userDefaultsManager)
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

    func test_didTapRigthBarButtonItem이_호출될_때() {
        sut.didTapRightBarButtonItem()

        XCTAssertTrue(viewController.isCalledPresentToReviewWriteViewController)
    }

    func test_viewWillAppear가_호출될_때() {
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isCalledGetReviews)
    }
}
