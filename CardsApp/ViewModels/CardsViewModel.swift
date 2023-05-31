//
//  CardsViewModel.swift
//  CardsApp
//
//  Created by leandro de araujo estrada on 31/05/23.
//

import Foundation

protocol CardsViewModelDelegate: AnyObject {
    func cardsLoaded()
    func cardsLoadFailed(with error: Error)
}

class CardsViewModel {
    
    private let network: Networking
    var cards: [Card] = []
    
    weak var delegate: CardsViewModelDelegate?
    
    init(network: Networking = Networking()) {
        self.network = network
    }
    
    func fetchCards() {
        network.getCards { [weak self] result in
            switch result {
            case .success(let cards):
                self?.cards = cards.basic
                self?.delegate?.cardsLoaded()
            case .failure(let error):
                self?.delegate?.cardsLoadFailed(with: error)
            }
        }
    }

    func numberOfCards() -> Int {
        return cards.count
    }
    
    func card(at index: Int) -> Card {
        return cards[index]
    }
    
}
