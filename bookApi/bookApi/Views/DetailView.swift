//
//  DetailView.swift
//  foo
//
//  Created by Marina Santana on 22.05.24.
//

import SwiftUI

struct DetailView: View {
    @State var book = Book.createMock()
    @State var cover = UIImage(systemName: "photo.fill")!
    
    var body: some View {
        Group {
            Spacer()
            Image(uiImage: cover)
            Text("by \(book.authors)")
                .font(Font.title3)
            Spacer()
        }
        .onAppear {
            BookAPI.fetchImage(from: book.image) { data in
                if let data = data, let image = UIImage(data: data) {
                    cover = image
                }
            }
        }
        .navigationTitle(Text(book.title).font(.title))

    }
}



#Preview {
    NavigationStack {
        DetailView()
    }
    
}
