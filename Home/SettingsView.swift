//
//  SettingsView.swift
//  Caloryzee
//
//  Created by Nava Kanth on 4/16/23.
//

import SwiftUI
import HealthKit
import NavigationStack

struct SettingsView: View {
    let healthStore = HKHealthStore()
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
             Color.mint
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 30) // Adjust the height of the background
            }
                Section {
                    Button(action: {
                        DispatchQueue.main.async {
                            requestAuthorization { status in
                                print("success")
                            }
                        }
                    }, label: {
                        Text("Allow Health Permissions")
                            .font(.system(size: 15, weight: .bold, design: .rounded)).foregroundColor(.black)
                    })
                }.padding(.top)
                Section {
                    Button(action: {
                        // Handle second button tap
                    }, label: {
                            Text("Edit Profile")
                            .font(.system(size: 15, weight: .bold, design: .rounded)).foregroundColor(.black)
                    })
                }
                Section {
                    Button(action: {
                        isAuthenticated = false
                        DispatchQueue.main.async {
                            navigationStack.pop(to: .root)
                        }
                    }, label: {
                            Text("Logout")
                            .font(.system(size: 15, weight: .bold, design: .rounded)).foregroundColor(.black)
                    })
                  }
            Spacer()
            }
             .navigationBarTitle("Settings", displayMode: .large)
            }
    public func requestAuthorization(completion: @escaping (Bool) -> Void) {
             let energyType = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!
             let typesToShare = Set([energyType])
             let typesToRead = Set([energyType])
         DispatchQueue.main.async {
             healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
                 if success {
                     print("HealthKit authorization successful.")
                     completion(true)
                 } else {
                     print("HealthKit authorization failed with error: \(error?.localizedDescription ?? "unknown error")")
                     completion(false)
                     }
                 }
             }
         }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
