//
//  Game.swift
//  tennis
//
//  Created by Marina Santana on 28.05.24.
//

import Foundation

class Game: ObservableObject {
    private var playerOne = Player(name: "Player One", order: .first)
    private var playerTwo = Player(name: "Player Two", order: .second)

    @Published var winner: Player? = nil
    @Published var nextPlayer: Player!
    
    var score: (Status, Status) {
        (playerOne.status, playerTwo.status)
    }
    
    init() {
        nextPlayer = playerOne
    }
    
    
    func switchPlayers() {
        if nextPlayer.order == .first {
            nextPlayer = playerTwo
            return
        }
        nextPlayer = playerOne
    }
    
    func updatePlayersScore(by playingOrder: PlayingOrder) {
        let currentPlayer = playingOrder == .first ? playerOne : playerTwo
        
        let otherPlayer = playingOrder == .first ? playerTwo : playerOne
        
        switch currentPlayer.status {
            
            case .love:
                currentPlayer.status = .fifteen
            case .fifteen:
                currentPlayer.status = .thirty
                if otherPlayer.status == .love {
                    winner = currentPlayer
                    return
                }
            case .thirty:
                if otherPlayer.status == .forty {
                    currentPlayer.status = .deuce
                    otherPlayer.status = .deuce
                } else if (otherPlayer.status == .love || otherPlayer.status == .fifteen) {
                    currentPlayer.status = .forty
                    winner = playerOne
                    return
                } else {
                    currentPlayer.status = .forty
                }
            case .forty:
                if (otherPlayer.status != .thirty) {
                    winner = currentPlayer
                    return
                }
            case .deuce:
                if otherPlayer.status == .advantage {
                    otherPlayer.status = .deuce
                } else {
                    currentPlayer.status = .advantage
                }
            case .advantage:
                winner = currentPlayer
                return
        }
        switchPlayers()
    }
    
    func restart() {
        playerOne = Player(name: "Player One", order: .first)
        playerTwo = Player(name: "Player Two", order: .second)
        winner = nil
        nextPlayer = playerOne
    }
    
    
}
