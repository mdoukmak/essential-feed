//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Muhammad Doukmak on 11/26/23.
//

import EssentialFeed
import UIKit

public final class FeedUIComposer {

    private init() {}
    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let feedPresenter = FeedPresenter(feedLoader: feedLoader)
        let refreshController = FeedRefreshViewController(presenter: feedPresenter)
        let feedController = FeedViewController(refreshController: refreshController)
        feedPresenter.loadingView = refreshController
        feedPresenter.feedView = FeedViewAdapter(feedController: feedController, imageLoader: imageLoader)
        return feedController
    }
}

private final class FeedViewAdapter: FeedView {
    private weak var feedController: FeedViewController?
    private let imageLoader: FeedImageDataLoader

    init(feedController: FeedViewController, imageLoader: FeedImageDataLoader) {
        self.feedController = feedController
        self.imageLoader = imageLoader
    }

    func display(feed: [FeedImage]) {
        feedController?.tableModel = feed.map { model in
            let viewModel = FeedImageViewModel(model: model, imageLoader: imageLoader, imageTransformer: UIImage.init)
            return FeedImageCellController(viewModel: viewModel)
        }
    }
}
