//
//  FeedImageCell.swift
//  EssentialFeediOS
//
//  Created by Muhammad Doukmak on 11/25/23.
//

import UIKit

public final class FeedImageCell: UITableViewCell {
    public let locationContainer = UIView()
    public let locationLabel = UILabel()
    public let descriptionLabel = UILabel()
    public let feedImageContainer = UIView()
    public let feedImageView = UIImageView()
    private(set) public lazy var feedImageRetryButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        return button
    }()
    public var onRetry: (() -> Void)?

    @objc private func retryButtonTapped() {
        onRetry?()
    }
}
