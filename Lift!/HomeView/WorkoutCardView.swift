//
//  WorkoutCardView.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/21/26.
//

import SwiftUI

struct WorkoutCardView: View {
    
    @State var workoutPlan: WorkoutPlan
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(workoutPlan.planName)
                
                Spacer()
                Image(systemName: "play.circle")
            }.font(.title).bold().padding()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        .shadow(radius: 10)
    }
}

#Preview {
    let workoutPlan = WorkoutPlan(planName: "Leg day")
    WorkoutCardView(workoutPlan: workoutPlan)
        
}
