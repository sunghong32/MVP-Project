//
//  MovieDetailPresenter.swift
//  Movie
//
//  Created by 민성홍 on 2022/08/09.
//

import Foundation

protocol MovieDetailProtocoal: AnyObject {
    func setViews(with movie: Movie)
    func setRightBarButton(with isLiked: Bool)
}

final class MovieDetailPresenter {
    private weak var viewController: MovieDetailProtocoal?

    private let userDefaultsManager: UserDefaultsManagerProtocol

    private var movie: Movie

    init(
        viewController: MovieDetailProtocoal,
        movie: Movie,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.movie = movie
        self.userDefaultsManager = userDefaultsManager
    }

    func viewDidLoad() {
        viewController?.setViews(with: movie)
        viewController?.setRightBarButton(with: movie.isLiked)
    }

    func didTapRightBarButtonItem() {
        movie.isLiked.toggle()

        if movie.isLiked {
            userDefaultsManager.addMovie(movie)
        } else {
            userDefaultsManager.removeMovie(movie)
        }

        viewController?.setRightBarButton(with: movie.isLiked)
    }
}
