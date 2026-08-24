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
                addExerciseSheetView(exercises: $exercises)
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



