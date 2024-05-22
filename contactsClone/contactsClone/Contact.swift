//
//  Contact.swift
//  contactsClone
//
//  Created by Marina Santana on 14.05.24.
//

import Foundation

struct Contact: Identifiable, Comparable {
    static func < (lhs: Contact, rhs: Contact) -> Bool {
        lhs.name < rhs.name
    }
    
    let id = UUID()
    var name: String
    var emailAddress: String
    var image: String
    var initials: Character {
        name.lowercased().first!
    }
    //var birthday: Date
    //var phoneNumber: PhoneNumber
}


let contactTestList = [
    Contact(name: "Yanis Varoufakis", emailAddress: "varoufakis@gov.gr", image: "🇬🇷"),
    Contact(name: "Bruno Banani", emailAddress: "banani@icloud.com", image: "👔"),
    Contact(name: "Michael Burry", emailAddress: "burry@mbholdings.com", image: "📈"),
    Contact(name: "Christina Aguilera", emailAddress: "aguilera@warner.com", image: "🎵"),
    Contact(name: "Anne Hathaway", emailAddress: "hathaway@hbo.com", image: "🎬"),
    Contact(name: "Michael Jackson", emailAddress: "mj@warner.com", image: "🎵"),
]

