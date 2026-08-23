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
    @State var isShowingEditSheet = false
    @State var workoutPlanToEdit: WorkoutPlan?
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if(workoutPlans.isEmpty) {
                        Text("Add a workout to get started!")
                            .padding()
                    } else {
                        ForEach(workoutPlans) {workoutPlan in
                            NavigationLink {
                                WorkoutDetailView(workoutPlan: workoutPlan)
                            } label: {
                                WorkoutCardView(workoutPlan: workoutPlan)
                                    .foregroundStyle(.foreground)
                                    .contextMenu {
                                        Button {
                                            workoutPlanToEdit = workoutPlan
                                        } label: {
                                            Image(systemName: "pencil")
                                            Text("Edit")
                                        }
                                        
                                        Button(role: .destructive) {
                                            
                                        } label: {
                                            Image(systemName: "trash")
                                            Text("Delete")
                                        }
                                    }
                            }
                        }
                    }
                }
            }.navigationTitle("Start Lift!")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing){
                        NavigationLink {
                            AddWorkoutView()
                        } label: {
                            Image(systemName: "plus")
                                
                        }
                    }
                    
                }
        }.sheet(item: $workoutPlanToEdit) { workout in
            NameEditSheetView(workoutPlan: workout)
                .presentationDetents([.height(180)])
        }
    }
}

#Preview {
    HomeScreen()
        .modelContainer(PreviewData.container)
}
