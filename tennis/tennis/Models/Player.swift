//
//  Player.swift
//  tennis
//
//  Created by Marina Santana on 28.05.24.
//

import Foundation

class Player {
    var status: Status = .love
    private(set) var points = 0
    
    var hasMinimumPoints: Bool {
        points >= 4
    }
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func increasePoints() {
        points += 1
    }
}
