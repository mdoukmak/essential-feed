//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Muhammad Doukmak on 11/24/23.
//

import Foundation

func anyURL() -> URL {
    URL(string: "https://any-url")!
}

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}
