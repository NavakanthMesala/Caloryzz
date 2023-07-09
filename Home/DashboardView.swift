//
//  DashboardView.swift
//  Caloryzee
//
//  Created by Nava Kanth on 4/16/23.
//

import SwiftUI
import HealthKit


struct DashboardView: View {
    @StateObject private var setBackground = RadiantBackground()
    @State private var trackWater = 0
    @State private var isShowingSheet = false
    @State private var caloriesBurnt: Int = 0
    let healthStore = HKHealthStore()
    let calendar = Calendar.current
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
             Color.mint
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 30) // Adjust the height of the background
            }
                    VStack(spacing: 10) {
                    Text("Calories Burnt")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                        Text("\(caloriesBurnt)")
                            .font(.system(size: 55, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                    HStack(spacing: 5) {
                        Image(systemName: "applewatch").foregroundColor(.black)
                        Text("Tracked from apple watch")
                            .font(.system(size: 15, weight: .thin, design: .monospaced))
                            .foregroundColor(.black)
                        }
                    }
            Spacer()
            Section {
                VStack(spacing: 10) {
                    Text("Track water")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                HStack(spacing: 15) {
                    Spacer()
                    Button {
                        trackWater = trackWater+1
                    } label: {
                        Image(systemName: "plus")
                            .scaleEffect(1.5)
                            .foregroundColor(.orange)
                    }
                    Text("\(trackWater)")
                        .font(.system(size: 55, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                    Button {
                        trackWater = trackWater-1
                    } label: {
                        Image(systemName: "minus.square")
                            .scaleEffect(1.5)
                            .foregroundColor(.orange)
                    }
                Spacer()
                }.padding()
            }
            }
    Spacer()
        }.sheet(isPresented: $isShowingSheet, content: {
            VStack {
                Text("Hello! Please allow health-Kit access from settings.")
                    .font(.headline)
                    .padding()
                
                Button(action: {
                    isShowingSheet = false
                }) {
                    Text("Close")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding()
        })
        .navigationBarTitle("Home", displayMode: .large)
            .onAppear {
                let hasShownSheet = UserDefaults.standard.bool(forKey: "HasShownSheet")
                            if !hasShownSheet {
                                isShowingSheet = true
                                UserDefaults.standard.set(true, forKey: "HasShownSheet")
                            }
                fetchCalories()
            }
    }
    

    private func fetchCalories() {
        let energyType = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date()) // Fetch calories for the last 7 days
        let endDate = Date()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        let query = HKSampleQuery(sampleType: energyType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in
            if let samples = results as? [HKQuantitySample] {
                let totalCalories = samples.reduce(0.0) { $0 + $1.quantity.doubleValue(for: .kilocalorie()) }
                self.caloriesBurnt = Int(totalCalories)
            }
        }
        healthStore.execute(query)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
