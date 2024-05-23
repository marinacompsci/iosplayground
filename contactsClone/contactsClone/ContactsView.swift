//
//  ContactsView.swift
//  contactsClone
//
//  Created by Marina Santana on 14.05.24.
//

import SwiftUI

struct ContactsView: View {
    static let tabName = "Contacts"
    
    @State private var initials: Set<Character> = []
    @State private var searchWord = ""
    @State private var list = contactTestList

    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(initials).sorted(), id: \.self) { item in
                    Section(String(item).uppercased()) {
                        ForEach(list.filter({el in el.initials == item})
                            .sorted(by: {
                                $0.name < $1.name
                            }))
                        {
                            Text($0.name)
                        }
                    }
                }
            }
            
            .onChange(of: list, initial: true) {
                initials = Set(list.map({el in el.initials}))
            }
            .listStyle(.plain)
        }
        .searchable(text: $searchWord)
        .onChange(of: searchWord, initial: true) { _, newValue  in
            list = newValue.isEmpty ? contactTestList : contactTestList.filter { el in
                el.name.localizedStandardContains(newValue.lowercased())
            }
        }
    }
    
}

#Preview {
    ContactsView()
        .environment(\.colorScheme, .dark)
}
