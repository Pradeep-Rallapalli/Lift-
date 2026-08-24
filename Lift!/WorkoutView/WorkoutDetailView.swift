//
//  WorkoutDetailView.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/21/26.
//

import SwiftUI
import SwiftData

struct WorkoutDetailView: View {
    
    let workoutPlan: WorkoutPlan
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
                
                Button {
                    //TODO: Start workout session
                    
                } label: {
                        Text("Start Workout")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                
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
