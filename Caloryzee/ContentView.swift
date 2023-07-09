//
//  ContentView.swift
//  Caloryzee
//
//  Created by Nava Kanth on 4/16/23.
//

import SwiftUI
import NavigationStack

struct ContentView: View {
    var body: some View {
        NavigationStackView {
            WelcomePage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
