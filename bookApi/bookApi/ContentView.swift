//
//  ContentView.swift
//  foo
//
//  Created by Marina Santana on 18.05.24.
//

    import SwiftUI

    struct ContentView: View {
        @State var books: [Book] = [Book.createMock()]
        
        var body: some View {
            NavigationStack {
                List {
                    ForEach(books) { item in
                        NavigationLink{
                            DetailView(book: item)
                        } label: {
                            Text(item.title)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle(Text("Books"))
                
                HStack {
                    Spacer()
                    Text("\(books.count) books")
                        .padding(.trailing)
                        .font(Font.caption2)
                }
                .textCase(.uppercase)
                
            }
            .onAppear {
                BookAPI.fetchRecents() { data in
                    let decoder = JSONDecoder()
                    guard let data else { fatalError("No data fetched") }
                    do {
                        let resp = try decoder.decode(BookAPIResponse.self, from: data)
                        books = resp.books
                    } catch {
                        print("JSON Data could not be decoded into custom type")
                    }
                }
            }
        }
    }

    #Preview {
        ContentView()
    }

