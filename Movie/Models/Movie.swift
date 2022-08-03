//
//  Movie.swift
//  Movie
//
//  Created by 민성홍 on 2022/08/02.
//

import Foundation

struct Movie: Decodable {
    let title: String
    private let image: String
    let userRating: String
    let actor: String
    let director: String
    let pubDate: String

    var imageURL: URL? { URL(string: image) }

    init(
        title: String,
        imageURL: String,
        userRating: String,
        actor: String,
        director: String,
        pubData: String
    ) {
        self.title = title
        self.image = imageURL
        self.userRating = userRating
        self.actor = actor
        self.director = director
        self.pubDate = pubData
    }
}
