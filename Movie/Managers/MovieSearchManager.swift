//
//  MovieSearchManager.swift
//  Movie
//
//  Created by 민성홍 on 2022/08/02.
//

import Foundation
import Alamofire

protocol MovieSearchManagerProtocol {
    func request(from keyword: String, completionHandler: @escaping ([Movie]) -> Void)
}

struct MovieSearchManager {
    func request(from keyword: String, completionHandler: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/movie.json") else { return }

        let parmeters = MovieSearchRequestModel(query: keyword)

        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "03QSDo7c8CwHbXiMjhwa",
            "X-Naver-Client-Secret": "AaXSCBN7Yx"
        ]

        AF.request(
            url,
            method: .get,
            parameters: parmeters,
            headers: headers
        )
        .responseDecodable(of: MovieSearchResponseModel.self) { response in
            switch response.result {
            case .success(let result):
                completionHandler(result.items)
            case .failure(let error):
                print(error)
            }
        }
        .resume()
    }
}
