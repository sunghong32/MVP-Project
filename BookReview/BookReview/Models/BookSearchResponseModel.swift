//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by 민성홍 on 2022/07/26.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items: [Book] = []
}
