//
//  AddWorkoutView.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/22/26.
//

import SwiftUI
import SwiftData

struct AddWorkoutView: View {
    @State var workoutPlanName = ""
    @State var exercises: [Exercise] = []
    @State var isShowingAddExerciseSheet = false
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        TextField(text: $workoutPlanName) {
                            Text("Plan name (Required)")
                        }
                        .font(.title.bold())
                        .padding(.top, 48)
                        
                        ForEach(exercises) {exercise in
                            ExerciseCardView(exercise: exercise)
                        }
                        
                        
                    }.padding()
                }.scrollDismissesKeyboard(.immediately)
                
                Button {
                    isShowingAddExerciseSheet = true
                    
                } label: {
                        Text("Add Exercise")
                        Image(systemName: "plus")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                
            }
            .sheet(isPresented: $isShowingAddExerciseSheet) {
                ExerciseSheetView(exercises: $exercises)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newPlan = WorkoutPlan(planName: workoutPlanName, exercises: exercises)
                        modelContext.insert(newPlan)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
            .navigationTitle("New Workout")
        }
    }
}

#Preview {
    AddWorkoutView()
}


struct ExerciseSheetView: View {
    @Binding var exercises: [Exercise]
    
    @State var exerciseName = ""
    @State var sets = 0
    @State var reps = 0
    @State var weight =  0.0
    @State var restTime = "1:40"
    
    @Environment(\.dismiss) private var dismiss

    
    var body: some View {
        NavigationStack {
            Form {
                Section("New Exercise") {
                    TextField(text: $exerciseName) {
                        Text("Exercise name")
                    }
                }
                Section("Exercise Details") {
                    Picker("Sets", selection: $sets) {
                        ForEach(1...10, id: \.self) { set in
                            Text("\(set)").tag(set)
                        }
                    }.pickerStyle(.automatic)
                    
                    Picker("Reps", selection: $reps) {
                        ForEach(1...10, id: \.self) { rep in
                            Text("\(rep)").tag(rep)
                        }
                    }.pickerStyle(.automatic)
                    
                    Picker("Starting Weight", selection: $weight) {
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
                       let exercise = Exercise(name: exerciseName, sets: sets, reps: reps, weight: weight, restTime: convertedRestTime)
                        exercises.append(exercise)
                        dismiss()
                    } label: {
                        Text("Confirm")
                    }
                }
            }
        }
    }
}


