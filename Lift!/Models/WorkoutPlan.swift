//
//  WorkoutPlan.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/20/26.
//

import SwiftData

@Model
class WorkoutPlan {
    var planName: String
    @Relationship(deleteRule: .cascade)
    var exercises: [Exercise]
    
    init(planName: String, exercises: [Exercise] = []) {
        self.planName = planName
        self.exercises = exercises
    }
}
