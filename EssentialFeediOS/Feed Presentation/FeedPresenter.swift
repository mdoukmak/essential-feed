//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Muhammad Doukmak on 11/26/23.
//

import EssentialFeed
import Foundation

struct FeedLoadingViewModel {
    let isLoading: Bool
}

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}

struct FeedViewModel {
    let feed: [FeedImage]
}
protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}

final class FeedPresenter {
    typealias Observer<T> = (T) -> Void

    var loadingView: FeedLoadingView?
    var feedView: FeedView?

    func didStartLoadingFeed() {
        loadingView?.display(FeedLoadingViewModel(isLoading: true))
    }

    func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedView?.display(FeedViewModel(feed: feed))
        loadingView?.display(FeedLoadingViewModel(isLoading: false))
    }

    func didFinishLoading(with error: Error) {
        loadingView?.display(FeedLoadingViewModel(isLoading: false))
    }
}

