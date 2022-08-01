//
//  MockUserDefaultsManager.swift
//  BookReviewTests
//
//  Created by 민성홍 on 2022/08/01.
//

import Foundation

@testable import BookReview

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var isCalledGetReviews = false
    var isCalledSetReviews = false

    func getReviews() -> [Review] {
        isCalledGetReviews = true

        return []
    }

    func setReview(_ newValue: Review) {
        isCalledSetReviews = true
    }
}
