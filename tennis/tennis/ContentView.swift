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
                    Text("\(game.nextPlayer!.name)")

                    HStack {
                            Button {
                                print("\(game.nextPlayer.name) scored")
                                game.updatePlayersScore(by: game.nextPlayer.order)
                            } label: {
                                Text("Score")
                            }
                            .padding()
                            Button {
                                game.switchPlayers()
                                print("\(game.nextPlayer.name) missed")
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
