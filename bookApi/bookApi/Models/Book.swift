//
//  Book.swift
//  foo
//
//  Created by Marina Santana on 22.05.24.
//

import Foundation

struct Book: Codable, Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let authors: String
    let url: String
    let image: String
    
    static func createMock() -> Book {
        return Book(id: "1h23279380", title: "The Alchimist", subtitle: "", authors: "Paulo Coelho", url: "", image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1442866592i/9276509._UY500_SS500_.jpg")
    }
}
