//
//  Book.swift
//  BookReview
//
//  Created by 민성홍 on 2022/07/26.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?

    var imageURL: URL? {
        get {
            URL(string:  image ?? "")
        }
    }
}
