//
//  CaloryzeView.swift
//  Caloryzee
//
//  Created by Nava Kanth on 4/16/23.
//

import SwiftUI

struct CaloryzeView: View {
    var body: some View {
        VStack(spacing: 0)  {
            ZStack {
             Color.mint
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 30) // Adjust the height of the background
            }
            VStack(spacing: 10) {
            Text("Feature coming soon...")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
            }
            Spacer()
        }.navigationBarTitle("Caloryze", displayMode: .large)
    }
}

struct CaloryzeView_Previews: PreviewProvider {
    static var previews: some View {
        CaloryzeView()
    }
}
