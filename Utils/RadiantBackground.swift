//
//  RadiantBackground.swift
//  Caloryzee
//
//  Created by Nava Kanth on 4/16/23.
//

import Foundation
import SwiftUI

class RadiantBackground: ObservableObject {
    
    func setRadiantBackground() -> some View {
        return RadialGradient(gradient: Gradient(colors: [.yellow, .orange]), center: .center, startRadius: 0, endRadius: 500)
            .edgesIgnoringSafeArea(.all)
        
    }
    func setRadiantBackgroundHome() -> some View {
        return RadialGradient(gradient: Gradient(colors: [.white, .white]), center: .center, startRadius: 0, endRadius: 500)
            .edgesIgnoringSafeArea(.all)
        
    }
    func setRadiantBackgroundHomeMiddle() -> some View {
        return RadialGradient(gradient: Gradient(colors: [.black, .black]), center: .center, startRadius: 0, endRadius: 500)
            .edgesIgnoringSafeArea(.all)
        
    }
}
