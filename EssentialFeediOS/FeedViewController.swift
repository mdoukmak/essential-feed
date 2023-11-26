//
//  FeedViewController.swift
//  EssentialFeediOS
//
//  Created by Muhammad Doukmak on 11/25/23.
//

import UIKit
import EssentialFeed

public final class FeedViewController: UITableViewController {
    private var loader: FeedLoader?
    private var onViewIsAppearing: ((FeedViewController) -> Void)?

    convenience public init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(load), for: .valueChanged)

        load()

        onViewIsAppearing = { vc in
            vc.refreshControl?.beginRefreshing()
            vc.onViewIsAppearing = nil
        }
    }

    override public func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)

        onViewIsAppearing?(self)
    }

    @objc private func load() {
        refreshControl?.beginRefreshing()
        loader?.load { [weak self] _ in
            self?.refreshControl?.endRefreshing()
        }
    }
}
