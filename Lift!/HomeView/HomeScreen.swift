//
//  HomeScreen.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/21/26.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
    @Query var workoutPlans: [WorkoutPlan]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if(workoutPlans.isEmpty) {
                        Text("Add a workout to get started!")
                            .padding()
                    } else {
                        ForEach(workoutPlans) {workoutPlan in
                            WorkoutCardView(workoutPlan: workoutPlan)
                        }
                    }
                }
            }.navigationTitle("Start Lift!")
        }
    }
}

#Preview {
    HomeScreen()
        .modelContainer(PreviewData.container)
}
