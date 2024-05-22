//
//  ContactsView.swift
//  contactsClone
//
//  Created by Marina Santana on 14.05.24.
//

import SwiftUI

struct ContactsView: View {
    static let tabName = "Contacts"
    @State private var list: [Contact] = []
    private var initials: Set<Character> = Set(contactTestList.map({el in el.initials}))
    
    var body: some View {
        List {
            
            ForEach(Array(initials).sorted(), id: \.self) { item in
                Section(String(item).uppercased()) {
                    ForEach(contactTestList.filter({el in el.initials == item})
                        .sorted(by: {
                            $0.name < $1.name
                        }))
                    {
                        Text($0.name)
                    }
                }
            }
        }
        .listStyle(.plain)
    }
    
}

#Preview {
    ContactsView()
}
