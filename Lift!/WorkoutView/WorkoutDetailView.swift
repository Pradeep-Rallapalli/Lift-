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

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(workoutPlan.exercises) { exercise in
                        ExerciseCardView(exercise: exercise)
                    }
                }
            }.navigationTitle(workoutPlan.planName).toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    WorkoutDetailView(workoutPlan: PreviewData.planA)
}
