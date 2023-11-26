//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Muhammad Doukmak on 11/26/23.
//

import UIKit

public final class FeedRefreshViewController: NSObject, FeedLoadingView {
    public lazy var view: UIRefreshControl = loadView()

    private let loadFeed: () -> Void

    init(loadFeed: @escaping () -> Void) {
        self.loadFeed = loadFeed
    }

    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view.beginRefreshing()
        } else {
            view.endRefreshing()
        }
    }

    @objc func refresh() {
        loadFeed()
    }

    private func loadView() -> UIRefreshControl {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}
