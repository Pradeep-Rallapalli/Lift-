//
//  editExerciseSheetView.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/24/26.
//

import SwiftUI
import SwiftData

struct editExerciseSheetView: View {
    @Bindable var exerciseToEdit: Exercise
    @State private var restTime = "1:40"
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    var body: some View {
        NavigationStack {
            Form {
                Section("Exercise") {
                    TextField(text: $exerciseToEdit.name) {
                        Text("Exercise name")
                    }
                }
                Section("Exercise Details") {
                    Picker("Sets", selection: $exerciseToEdit.sets) {
                        ForEach(1...10, id: \.self) { set in
                            Text("\(set)").tag(set)
                        }
                    }.pickerStyle(.automatic)
                    
                    Picker("Reps", selection: $exerciseToEdit.reps) {
                        ForEach(1...10, id: \.self) { rep in
                            Text("\(rep)").tag(rep)
                        }
                    }.pickerStyle(.automatic)
                    
                    Picker("Starting Weight", selection: $exerciseToEdit.weight) {
                        ForEach(Array(stride(from: 10.0, through: 200.0, by: 5)), id: \.self) { weight in
                            Text(String(format: "%.2f LB", weight)).tag(weight)
                        }
                    }.pickerStyle(.automatic)
                }
                
                Section("Rest Time (Compound/Isolated)") {
                    Picker("Time", selection: $restTime) {
                        ForEach(["1:40", "2:20"], id: \.self) { restTime in
                            Text("\(restTime)").tag(restTime)
                        }
                    }.pickerStyle(.palette)
                }
            }.toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button(role: .destructive) {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(Color.red)
                    }
                }
                
                ToolbarItem(placement: .confirmationAction){
                    Button(role: .confirm) {
                        var convertedRestTime = 0
                        if(restTime == "1:40") {
                            convertedRestTime = 100
                        } else {
                            convertedRestTime = 140
                        }
                        exerciseToEdit.restTime = convertedRestTime
                        do {
                            try context.save()
                        } catch {
                            print("Exercise failed to save!")
                        }
                        dismiss()
                    } label: {
                        Text("Confirm")
                    }
                }
            }
        }

    }
}


