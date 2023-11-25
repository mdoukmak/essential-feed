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

    private var deletionCompletions: [DeletionCompletion] = []
    private var insertionCompletions: [InsertionCompletion] = []

    private(set) var receivedMessages = [ReceivedMessage]()

    enum ReceivedMessage: Equatable {
        case deleteCachedFeed
        case insert([LocalFeedImage], Date)
        case retrieve
    }

    func retrieve() {
        receivedMessages.append(.retrieve)
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
}
