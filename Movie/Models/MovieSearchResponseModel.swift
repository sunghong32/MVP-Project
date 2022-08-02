//
//  MovieSearchResponseModel.swift
//  Movie
//
//  Created by 민성홍 on 2022/08/02.
//

import Foundation

struct MovieSearchResponseModel: Decodable {
    var items: [Movie] = []
}
