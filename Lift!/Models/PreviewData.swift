//
//  PreviewData.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/21/26.
//

import Foundation
import SwiftData

/// Centralized mock data for SwiftUI previews backed by an in-memory SwiftData container.
enum PreviewData {
    // MARK: - Sample Exercises
    static let sampleExercisesA: [Exercise] = [
        Exercise(name: "Back Squat", sets: 5, reps: 5, weight: 180, restTime: 180),
        Exercise(name: "Bench Press", sets: 5, reps: 5, weight: 185, restTime: 150),
        Exercise(name: "Barbell Row", sets: 5, reps: 5, weight: 155, restTime: 150)
    ]

    static let sampleExercisesB: [Exercise] = [
        Exercise(name: "Deadlift", sets: 5, reps: 3, weight: 315, restTime: 240),
        Exercise(name: "Overhead Press", sets: 5, reps: 5, weight: 95, restTime: 120),
        Exercise(name: "Pull-Up", sets: 3, reps: 8, weight: 0, restTime: 120)
    ]

    // MARK: - Sample Plans
    static let planA: WorkoutPlan = {
        WorkoutPlan(planName: "StrongLifts A", exercises: sampleExercisesA)
    }()

    static let planB: WorkoutPlan = {
        WorkoutPlan(planName: "StrongLifts B", exercises: sampleExercisesB)
    }()

    // MARK: - Sample Log
    static let todayLog: WorkoutLog = {
        WorkoutLog(date: Date(), workoutsFinished: [planA])
    }()

    // MARK: - In-memory ModelContainer seeded with sample data
    static var container: ModelContainer = {
        let schema = Schema([
            WorkoutPlan.self,
            Exercise.self,
            WorkoutLog.self
        ])
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: configuration)

        // Ensure back-references are linked if your model uses them.
        // Note: The provided Exercise model shows a property named `WorkoutPlan`. We link it here.
        for exercise in sampleExercisesA { exercise.workoutPlan = planA }
        for exercise in sampleExercisesB { exercise.workoutPlan = planB }

        // Insert sample data
        container.mainContext.insert(planA)
        container.mainContext.insert(planB)
        container.mainContext.insert(todayLog)

        return container
    }()
}
