//
//  ViewController.swift
//  Movie
//
//  Created by 민성홍 on 2022/08/02.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        MovieSearchManager().request(from: "스타워즈") { movies in
            print("\(movies)")
        }
    }
}
