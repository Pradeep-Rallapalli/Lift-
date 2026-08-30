//
//  ExerciseSessionView.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/29/26.
//

import SwiftUI

struct ExerciseSessionView: View {
    
    @Bindable var exercise: Exercise
    @Binding var exerciseIndex: Int
    
    var body: some View {

        VStack {
            Text("Here")
        }.navigationTitle("Plan Name")
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea()
    }
}

#Preview {
    ExerciseSessionView(exercise: PreviewData.sampleExercisesA[0], exerciseIndex: .constant(0))
}
