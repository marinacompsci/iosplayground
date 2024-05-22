//
//  BookAPIResponse.swift
//  foo
//
//  Created by Marina Santana on 22.05.24.
//

import Foundation

struct BookAPIResponse: Codable {
    let status: String
    let total: Int
    let books: [Book]
}
