//
//  Player.swift
//  tennis
//
//  Created by Marina Santana on 28.05.24.
//

import Foundation

class Player {
    var status: Status = .love
    var name: String
    let order: PlayingOrder!
    
    init(name: String, order: PlayingOrder) {
        self.name = name
        self.order = order
    }
}
