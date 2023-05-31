//
//  CardDetailViewModel.swift
//  CardsApp
//
//  Created by leandro de araujo estrada on 31/05/23.
//

import Foundation

class CardDetailViewModel {
    private let card: Card

    init(card: Card) {
        self.card = card
    }

    var name: String {
        return card.name
    }

    var cardSet: String {
        return card.cardSet
    }

    var type: String {
        return card.type
    }

    var attack: Int? {
        return card.attack
    }

    var cost: Int? {
        return card.cost
    }

    var health: Int? {
        return card.health
    }

    var img: URL? {
        guard let imgString = card.img else { return nil }
        return URL(string: imgString)
    }
}
