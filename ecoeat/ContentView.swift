//
//  ContentView.swift
//  ecoeat
//
//  Created by Malika Sharma on 2024-05-05.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            NavigationLink(destination:
                            MenuView()) {HomeView()}
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
