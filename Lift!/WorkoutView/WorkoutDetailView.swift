//
//  WorkoutDetailView.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/21/26.
//

import SwiftUI
import SwiftData

struct WorkoutDetailView: View {
    
    @Bindable var workoutPlan: WorkoutPlan
    @State var exerciseToEdit: Exercise?
    @Environment(\.modelContext) var context
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(workoutPlan.exercises) { exercise in
                            ExerciseCardView(exercise: exercise).contextMenu {
                                Button {
                                    exerciseToEdit = exercise
                                } label: {
                                    Image(systemName: "pencil")
                                    Text("Edit")
                                }
                                
                                Button(role: .destructive) {
                                    context.delete(exercise)
                                } label: {
                                    Image(systemName: "trash")
                                    Text("Delete")
                                }
                            }
                        }
                    }
                }
                
                NavigationLink {
                    WorkoutSessionView(workoutPlan: workoutPlan)
                    
                } label: {
                    Text("Start Workout")
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .buttonSizing(.flexible)
                
            }
            .sheet(item: $exerciseToEdit) { exercise in
                editExerciseSheetView(exerciseToEdit: exercise)
            }
            .navigationTitle(workoutPlan.planName).toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    WorkoutDetailView(workoutPlan: PreviewData.planA)
}
/*
 
 1. User clicks on exercise.
 2. Sheet view opens with pre populated fields.
 3. User updates exercise
 4. Persistant store updates that specific exercise with new values
 
 
 */
