//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Muhammad Doukmak on 11/25/23.
//

import XCTest


final class FeedViewController: UIViewController {
    private var loader: FeedViewControllerTests.LoaderSpy?

    convenience init(loader: FeedViewControllerTests.LoaderSpy) {
        self.init()
        self.loader = loader
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loader?.load()
    }
}

final class FeedViewControllerTests: XCTestCase {
    func test_init_doesNotLoadFeed() {
        let (_, loader) = makeSUT()

        XCTAssertEqual(loader.loadCallCount, 0)
    }

    func test_viewDidLoad_loadsFeed() {
        let (sut, loader) = makeSUT()

        sut.loadViewIfNeeded()

        XCTAssertEqual(loader.loadCallCount, 1)
    }

    class LoaderSpy {
        private(set) var loadCallCount = 0

        func load() {
            loadCallCount += 1
        }
    }

    private func makeSUT() -> (sut: FeedViewController, loader: LoaderSpy) {
        let loader = LoaderSpy()
        let sut = FeedViewController(loader: loader)
        return (sut, loader)
    }
}
