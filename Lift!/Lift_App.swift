//
//  Lift_App.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/21/26.
//

import SwiftUI
import SwiftData

@main
struct Lift_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Exercise.self, WorkoutPlan.self, WorkoutLog.self])

    }

}
