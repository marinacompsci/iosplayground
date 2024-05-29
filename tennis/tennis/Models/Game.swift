//
//  Game.swift
//  tennis
//
//  Created by Marina Santana on 28.05.24.
//

import Foundation

class Game: ObservableObject {
    private var playerOne = Player(name: "Player One")
    private var playerTwo = Player(name: "Player Two")

    @Published var winner: Player? = nil
    @Published var currentPlayer: Player!
    
    var score: (Status, Status) {
        (playerOne.status, playerTwo.status)
    }
    
    var otherPlayer: Player {
        currentPlayer === playerOne ? playerTwo : playerOne
    }
    
    var currentPlayerWon: Bool {
        currentPlayer.hasMinimumPoints && currentPlayerHasPointsAdvantage
    }
    
    var currentPlayerHasPointsAdvantage: Bool {
        currentPlayer.points - otherPlayer.points >= 2
    }
    
    init() {
        currentPlayer = playerOne
    }
    
    func updateCurrentPlayerStatus() {
        currentPlayer.increasePoints()

        switch currentPlayer.status {
        case .love:
            currentPlayer.status = .fifteen
        case .fifteen:
            currentPlayer.status = .thirty
        case .thirty:
            currentPlayer.status = .forty
        case .forty:
            if (currentPlayer.hasMinimumPoints && currentPlayerHasPointsAdvantage) {
                fallthrough
            } else if otherPlayer.status == .advantage {
                otherPlayer.status = .forty
            }
            currentPlayer.status = .advantage
        case .advantage:
            currentPlayer.status = .game
        case .game:
            return
        }
    }
    
    func currentPlayerScores() {
        updateCurrentPlayerStatus()
                
        if currentPlayerWon {
            winner = currentPlayer
            return
        }
                            
        switchPlayers()
    }
    
    func currentPlayerMisses() {
        switchPlayers()
    }
    
    private func switchPlayers() {
        if currentPlayer === playerOne {
            currentPlayer = playerTwo
            return
        }
        currentPlayer = playerOne
    }

    func restart() {
        playerOne = Player(name: "Player One")
        playerTwo = Player(name: "Player Two")
        winner = nil
        currentPlayer = playerOne
    }
    
}
