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
        (playerOne.currentStatus, playerTwo.currentStatus)
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
        
        switch currentPlayer.currentStatus {
            
            case .love:
                currentPlayer.currentStatus = .fifteen
            case .fifteen:
                currentPlayer.currentStatus = .thirty
                if otherPlayer.currentStatus == .love {
                    winner = currentPlayer
                    return
                }
            case .thirty:
                currentPlayer.currentStatus = .forty
                if (otherPlayer.currentStatus == .love || otherPlayer.currentStatus == .fifteen) {
                    winner = playerOne
                }
            case .forty:
                if currentPlayer.currentStatus == .forty {
                    currentPlayer.currentStatus = .deuce
                    otherPlayer.currentStatus = .deuce
                } else if (otherPlayer.currentStatus != .thirty || otherPlayer.currentStatus == .fifteen) {
                    winner = currentPlayer
                    return
                }
            case .deuce:
                if otherPlayer.currentStatus == .advantage {
                    otherPlayer.currentStatus = .deuce
                } else {
                    currentPlayer.currentStatus = .advantage
                }
            case .advantage:
                winner = currentPlayer
                return
        }
        nextPlayer = otherPlayer        
    }
    
    
    
}
