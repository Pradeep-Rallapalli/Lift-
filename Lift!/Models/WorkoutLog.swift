//
//  WorkoutLog.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/20/26.
//

import SwiftData
import Foundation

@Model
class WorkoutLog {
    var date: Date
    var workoutsFinished: [WorkoutPlan]
    
    init(date: Date, workoutsFinished: [WorkoutPlan] = []) {
        self.date = date
        self.workoutsFinished = workoutsFinished
    }
}
