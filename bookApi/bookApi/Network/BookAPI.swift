//
//  BookAPI.swift
//  foo
//
//  Created by Marina Santana on 22.05.24.
//




import Foundation

class BookAPI {
    static let source = "https://www.dbooks.org/api/recent"
    
    static func fetchRecents(completionHandler: @escaping (Data?) -> Void) {
        URLSession.shared.dataTask(with: URL(string: BookAPI.source)!) { data, resp, err in
            if let err {
                fatalError("Book could not be fecthed due to following error: \(err)")
            }
            completionHandler(data)
        }.resume()
    }
    
    static func fetchImage(from url: String, completionHandler: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err {
                fatalError("Image could not be fetched due to following error: \(err) ")
            }
            completionHandler(data)
        }
        .resume()
    }
    
}
