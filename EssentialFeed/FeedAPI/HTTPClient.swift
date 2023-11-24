//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Muhammad Doukmak on 11/24/23.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
