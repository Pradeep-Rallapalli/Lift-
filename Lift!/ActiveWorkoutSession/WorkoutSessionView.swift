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
    
    @State private var phase = workoutPhase.isFinished
    @Bindable var workoutPlan: WorkoutPlan
    @State private var index = 0
    @State private var workoutFinished = false
    @Environment (\.modelContext) private var context
    var body: some View {
        NavigationStack {
            switch phase {
            case .workingOut:
                ExerciseSessionView(state: $phase,planName: workoutPlan.planName, exercises: $workoutPlan.exercises)
            case .resting:
                RestingSessionView()
            case .isFinished:
                var workoutLog = WorkoutLog(date: Date(), workoutsFinished: [workoutPlan])
                context.insert(workoutLog)
            }
        }
    }
}

#Preview {
    WorkoutSessionView(workoutPlan: PreviewData.planA)
}
