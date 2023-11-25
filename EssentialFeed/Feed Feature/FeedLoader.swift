//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Muhammad Doukmak on 11/24/23.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
