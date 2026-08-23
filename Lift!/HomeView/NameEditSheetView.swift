//
//  NameEditSheetView.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/23/26.
//

import SwiftUI
import SwiftData

struct NameEditSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Bindable var workoutPlan: WorkoutPlan
    @State var planName = ""
    var body: some View {
        NavigationStack {
            
                TextField(text: $planName) {
                    Text("Plan Name")
                }
                .textFieldStyle(.plain)
                        .padding(.horizontal, 12)
                        .frame(height: 40)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray, lineWidth: 1)
                        }.padding()
                .navigationTitle("Edit Plan")
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button(role: .destructive) {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(Color.red)
                    }
                }
                
                ToolbarItem(){
                    Button() {
                        workoutPlan.planName = planName
                        dismiss()
                        do {
                            try context.save()
                        } catch {
                            print("Failed to save: \(error)")
                        }
                    } label: {
                        Text("Confirm")
                    }
                }
            }
        }
    }
}
