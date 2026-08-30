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
        
        switch phase {
        case .workingOut:
            ExerciseSessionView(exercise: workoutPlan.exercises[index], exerciseIndex: $index)
        case .resting:
            RestingSessionView()
        case .isFinished:
            Text("Done")
        }
    }
}

#Preview {
    WorkoutSessionView(workoutPlan: PreviewData.planA)
}
