//
//  UserDefaultsManager.swift
//  BookReview
//
//  Created by 민성홍 on 2022/07/27.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getReviews() -> [Review]
    func setReview(_ newValue: Review)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    enum Key: String {
        case review
    }

    func getReviews() -> [Review] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else { return [] }

        return (try? PropertyListDecoder().decode([Review].self, from: data)) ?? []
    }

    func setReview(_ newValue: Review) {
        var currentReviews: [Review] = getReviews()
        currentReviews.insert(newValue, at: 0)

        UserDefaults.standard.set(
            try? PropertyListEncoder().encode(currentReviews),
            forKey: Key.review.rawValue
        )
    }
}
