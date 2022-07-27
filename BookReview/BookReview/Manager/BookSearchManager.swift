//
//  BookSearchManager.swift
//  BookReview
//
//  Created by 민성홍 on 2022/07/26.
//

import Foundation
import Alamofire

struct BookSearchManager {
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }

        let parameters = BookSearchRequestModel(query: keyword)

        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "03QSDo7c8CwHbXiMjhwa",
            "X-Naver-Client-Secret": "AaXSCBN7Yx"
        ]

        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: BookSearchResponseModel.self) { response in
                switch response.result {
                    case .success(let result):
                        completionHandler(result.items)
                    case .failure(let error):
                        print("\(error.localizedDescription)")
                }
            }
    }
}
