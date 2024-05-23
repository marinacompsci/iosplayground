//
//  ContentView.swift
//  foo
//
//  Created by Marina Santana on 23.05.24.
//

import SwiftUI

struct ContentView: View {
    @State var progressValue = CGFloat(0)
    @State var progress: Progress = .zero
    let screenWidth = UIScreen.main.bounds.size.width
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text("")
                .frame(minWidth: 0, maxWidth: CGFloat(screenWidth), maxHeight: 25)
                .background(Color(.white))
                
            Text("")
                .frame(minWidth: 0, maxWidth: progressValue, maxHeight: 25)
                .background(Color(.red))
        }
        .cornerRadius(20)

        Button {
            withAnimation {
                progressValue = progress.change(currentProgress: progress, width: screenWidth)
            }
                            
        } label: {
            Text("Next")
        }
        .padding()

    }
}

enum Progress {
    case zero, fifty, hundred
    mutating func change(currentProgress: Progress, width: Double) -> CGFloat {
        switch currentProgress {
        case .zero:
            self = .fifty
            return CGFloat(width / 2)
        case .fifty:
            self = .hundred
            return CGFloat(width)
        case .hundred:
            self = .zero
            return CGFloat(0)
        }
    }
    

}


#Preview {
    ContentView()
}
