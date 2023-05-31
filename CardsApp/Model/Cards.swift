//
//  Cards.swift
//  CardsApp
//
//  Created by leandro de araujo estrada on 31/05/23.
//

import Foundation

struct Cards: Decodable {
    let basic: [Card]
        
    enum CodingKeys: String, CodingKey {
        case basic = "Basic"
    }
}

struct Card: Decodable {
    let name: String
    let cardSet: String
    let type: String
    let attack: Int?
    let cost: Int?
    let health: Int?
    let img: String?
}
