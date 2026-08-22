//
//  ExerciseCardView.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/21/26.
//

import SwiftUI
import SwiftData

struct ExerciseCardView: View {
    let exercise: Exercise
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(exercise.name)
                .font(.title2)
            Text("Sets: \(exercise.sets)")
            Text("Reps: \(exercise.reps)")
            Text("Max Weight: \(exercise.weight)")

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        .shadow(radius: 5)
    }
}

#Preview {
    ExerciseCardView(exercise: PreviewData.sampleExercisesA[0])
}
