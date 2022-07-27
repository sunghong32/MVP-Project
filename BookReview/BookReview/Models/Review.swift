//
//  Review.swift
//  BookReview
//
//  Created by 민성홍 on 2022/07/27.
//

import Foundation
import UIKit

struct Review: Codable {
    let title: String
    let contents: String
    let imageURL: URL?
}
