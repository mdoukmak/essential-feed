//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Muhammad Doukmak on 11/24/23.
//

import Foundation


public typealias CachedFeed = (feed: [LocalFeedImage], timestamp: Date)

public protocol FeedStore {
    typealias RetrievalResult = Result<CachedFeed?, Error>
    typealias RetrievalCompletion = (FeedStore.RetrievalResult) -> Void

    typealias DeletionResult = Result<Void, Error>
    typealias DeletionCompletion = (DeletionResult) -> Void

    typealias InsertionResult = Result<Void, Error>
    typealias InsertionCompletion = (InsertionResult) -> Void

    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    func retrieve(completion: @escaping RetrievalCompletion)
}
