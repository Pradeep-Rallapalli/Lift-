//
//  WorkoutSessionView.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/29/26.
//

import SwiftUI

enum workoutPhase {
    case workingOut
    case resting
    case isFinished
}

struct WorkoutSessionView: View {
    
    @State private var phase = workoutPhase.workingOut
    @Bindable var workoutPlan: WorkoutPlan
    @State private var index = 0
    var body: some View {
        NavigationStack {
            switch phase {
            case .workingOut:
                ExerciseSessionView(state: $phase,planName: workoutPlan.planName, exercises: $workoutPlan.exercises)
            case .resting:
                RestingSessionView()
            case .isFinished:
                Text("Done")
                NavigationLink {
                    HomeScreen()
                } label: {
                    Text("Home")
                }
            }
        }
    }
}

#Preview {
    WorkoutSessionView(workoutPlan: PreviewData.planA)
}
