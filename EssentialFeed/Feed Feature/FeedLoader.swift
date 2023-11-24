//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Muhammad Doukmak on 11/24/23.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
