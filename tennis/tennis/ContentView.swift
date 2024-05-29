//
//  ContentView.swift
//  tennis
//
//  Created by Marina Santana on 28.05.24.
//

import SwiftUI

struct ContentView: View {

    @StateObject var game = Game()
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Score")
                Text("\(game.score.0.rawValue.uppercased()) : \(game.score.1.rawValue.uppercased())")
            }
            Spacer()
            VStack {
                if game.winner == nil {
                    Text("\(game.currentPlayer!.name)")

                    HStack {
                        Button {
                            print("\(game.currentPlayer.name) scored")
                            game.currentPlayerScores()
                        } label: {
                            Text("Score")
                        }
                        .padding()
                        Button {
                            game.currentPlayerMisses()
                            print("\(game.currentPlayer.name) missed")
                        } label: {
                            Text("Miss")
                        }
                        .padding()
                    }
                } else {
                    Text("WINNER: \(game.winner!.name)")
                    Button {
                        game.restart()
                    } label: {
                        Text("Restart")
                    }
                }
            }
            .padding(.bottom)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
