//
//  ContentView.swift
//  contactsClone
//
//  Created by Marina Santana on 14.05.24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = ContactsView.tabName
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                ContactsView().tabItem {
                    Label(
                        title: { Text("Contacts")},
                        icon: { Image(systemName: "person.circle.fill") }
                    )
                }.tag(ContactsView.tabName)
                Text("Tab Content 1").tabItem {
                    Label(
                        title: { Text("Recents") },
                        icon: { Image(systemName: "clock.fill") }
                    )
                }.tag("Recents")
                
            }
            .navigationTitle($selectedTab)
        }
        
    }
}

#Preview {
    ContentView()
        .environment(\.colorScheme, .dark)
}

