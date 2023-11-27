//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Muhammad Doukmak on 11/26/23.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool

    var hasLocation: Bool {
        return location != nil
    }
}
