//
//  ContentView.swift
//  UnitConverter
//
//  Created by Djroton Noé SOSSOU on 22/01/2024.
//

import SwiftUI

struct ContentView: View {
    let unitsList: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    @State private var inputUnit: UnitLength = .meters
    @State private var outputUnit: UnitLength = .kilometers
    @State private var inputValue: Double = 0
    
    var convertedValue: Double {
        let inputMeasurement = Measurement(value: inputValue, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return Double(outputMeasurement.value)
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Input unit"){
                    Picker("Select input unit", selection: $inputUnit) {
                        ForEach(unitsList, id: \.self) { unit in
                            Text(unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output unit"){
                    Picker("Select output unit", selection: $outputUnit) {
                        ForEach(unitsList, id: \.self) { unit in
                            Text(unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Input value"){
                    TextField("Input value", value: $inputValue, format: .number)
                        .keyboardType(.numberPad)
                }
                
                Section("Out value"){
                    Text(convertedValue, format: .number)
                }
                
            }
            .navigationTitle("Unit converter")
        }
        
    }
}

