//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Muhammad Doukmak on 11/24/23.
//

import Foundation


public struct CachedFeed {
    public let feed: [LocalFeedImage]
    public let timestamp: Date

    public init(feed: [LocalFeedImage], timestamp: Date) {
        self.feed = feed
        self.timestamp = timestamp
    }
}

public protocol FeedStore {
    typealias RetrievalResult = Swift.Result<CachedFeed?, Error>
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    typealias RetrievalCompletion = (FeedStore.RetrievalResult) -> Void

    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    func retrieve(completion: @escaping RetrievalCompletion)
}
