//
//  CardsAppTests.swift
//  CardsAppTests
//
//  Created by leandro de araujo estrada on 01/06/23.
//

import XCTest
@testable import CardsApp

class CardDetailViewModelTests: XCTestCase {
    
    var card: Card!
    var viewModel: CardDetailViewModel!

    override func setUp() {
        super.setUp()
        card = Card(name: "Test", cardSet: "Test", type: "Test", attack: 5, cost: 10, health: 5, img: "https://example.com")
        viewModel = CardDetailViewModel(card: card)
    }

    override func tearDown() {
        card = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testCardDetailViewModel() {
        XCTAssertEqual(viewModel.name, "Test")
        XCTAssertEqual(viewModel.cardSet, "Test")
        XCTAssertEqual(viewModel.type, "Test")
        XCTAssertEqual(viewModel.attack, 5)
        XCTAssertEqual(viewModel.health, 5)
        XCTAssertEqual(viewModel.cost, 10)
        XCTAssertEqual(viewModel.img?.absoluteString, "https://example.com")
    }
}
