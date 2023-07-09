//
//  HomeView.swift
//  Caloryzee
//
//  Created by Nava Kanth on 4/16/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tab = .home
    enum Tab {
        case home
        case caloryze
        case settings
    }
        var body: some View {
                TabView(selection: $selectedTab) {
                    NavigationView {
                        DashboardView()
                    }
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tab.home)
                    
                    NavigationView {
                        CaloryzeView()
                    }
                    .tabItem {
                        Label("Caloryze", systemImage: "c.square")
                    }
                    .tag(Tab.caloryze)
                    
                    NavigationView {
                        SettingsView()
                    }
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag(Tab.settings)
                }.accentColor(.black)
    }
}

