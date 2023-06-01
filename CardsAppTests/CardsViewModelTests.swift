//
//  CardsViewModelTests.swift
//  CardsAppTests
//
//  Created by leandro de araujo estrada on 01/06/23.
//

import XCTest
@testable import CardsApp

class CardsViewModelTests: XCTestCase {
    
    var viewModel: CardsViewModel!
    var delegate: MockCardsViewModelDelegate!

    override func setUp() {
        super.setUp()
        viewModel = CardsViewModel(network: MockNetworking())
        delegate = MockCardsViewModelDelegate()
        viewModel.delegate = delegate
    }

    override func tearDown() {
        viewModel = nil
        delegate = nil
        super.tearDown()
    }
    
    func testFetchCards() {
        
        viewModel.fetchCards()
        
        XCTAssertTrue(delegate.cardsLoadedCalled)
        XCTAssertEqual(viewModel.numberOfCards(), 1)
    }
}

class MockCardsViewModelDelegate: CardsViewModelDelegate {
    var cardsLoadedCalled = false

    func cardsLoaded() {
        cardsLoadedCalled = true
    }

    func cardsLoadFailed(with error: Error) {
    }
}

class MockNetworking: Networking {
    override func getCards(completion: @escaping (Result<Cards, Error>) -> Void) {
        let card = Card(name: "Test", cardSet: "Test", type: "Test", attack: 5, cost: 10, health: 5, img: "https://example.com")
        let cards = Cards(basic: [card])
        completion(.success(cards))
    }
}
