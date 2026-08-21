//
//  Exercise.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/20/26.
//

import SwiftData

@Model
class Exercise {
    var name: String
    var sets: Int
    var reps: Int
    var weight: Double
    var restTime: Int
    var workoutPlan: WorkoutPlan?
    
    init(name: String, sets: Int, reps: Int, weight: Double, restTime: Int) {
        self.name = name
        self.sets = sets
        self.reps = reps
        self.weight = weight
        self.restTime = restTime
    }
}
