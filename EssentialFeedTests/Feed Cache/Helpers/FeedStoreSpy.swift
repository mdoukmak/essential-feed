//
//  FeedStoreSpy.swift
//  EssentialFeedTests
//
//  Created by Muhammad Doukmak on 11/24/23.
//

import EssentialFeed
import Foundation

final class FeedStoreSpy: FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    typealias RetrievalCompletion = (RetrieveCacheFeedResult) -> Void

    private var deletionCompletions: [DeletionCompletion] = []
    private var insertionCompletions: [InsertionCompletion] = []
    private var retrievalCompletions: [RetrievalCompletion] = []

    private(set) var receivedMessages = [ReceivedMessage]()

    enum ReceivedMessage: Equatable {
        case deleteCachedFeed
        case insert([LocalFeedImage], Date)
        case retrieve
    }

    func retrieve(completion: @escaping RetrievalCompletion) {
        receivedMessages.append(.retrieve)
        retrievalCompletions.append(completion)
    }

    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping (Error?) -> Void) {
        receivedMessages.append(.insert(feed, timestamp))
        insertionCompletions.append(completion)
    }

    func deleteCachedFeed(completion: @escaping (Error?) -> Void) {
        receivedMessages.append(.deleteCachedFeed)
        deletionCompletions.append(completion)
    }

    func completeDeletion(with error: Error, at index: Int = 0) {
        deletionCompletions[index](error)
    }

    func completeInsertion(with error: Error, at index: Int = 0) {
        insertionCompletions[index](error)
    }

    func completeInsertionSuccessfully(at index: Int = 0) {
        insertionCompletions[index](nil)
    }

    func completeDeletionSuccessfully(at index: Int = 0) {
        deletionCompletions[index](nil)
    }

    func completeRetrieval(with error: Error, at index: Int = 0) {
        retrievalCompletions[index](.failure(error))
    }

    func completeRetrievalWithEmptyCache(at index: Int = 0) {
        retrievalCompletions[index](.empty)
    }

    func completeRetrievalWith(with feed: [LocalFeedImage], timestamp: Date, at index: Int = 0) {
        retrievalCompletions[index](.found(feed: feed, timestamp: timestamp))
    }
}
