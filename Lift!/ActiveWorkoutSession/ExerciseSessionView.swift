//
//  ExerciseSessionView.swift
//  Lift!
//
//  Created by Pradeep Rallapalli on 8/29/26.
//

import SwiftUI

struct ExerciseSessionView: View {
    @Binding var state: workoutPhase
    let planName: String
    @Binding var exercises: [Exercise]
    @State var exerciseIndex = 0
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                Group {
                    Text(exercises[exerciseIndex].name).font(.headline)
                    Text("Sets: \(exercises[exerciseIndex].sets)").font(.subheadline)
                }.padding(.leading, 8)
                Divider()
                
                ScrollView {
                    ForEach(0..<exercises[exerciseIndex].sets, id: \.self) {set in
                        SetView(setName: set, reps: exercises[exerciseIndex].reps, weight: $exercises[exerciseIndex].weight)
                    }
                }
                
                Spacer()
                
                Button {
               
                    state = workoutPhase.isFinished
                    
                    
                } label: {
                    Text("Next").padding(.top, 8)
                        .padding(.bottom, 8)
                }
                
                .buttonStyle(.borderedProminent)
                .buttonSizing(.flexible)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .navigationTitle(planName)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExerciseSessionView(state: .constant(workoutPhase.workingOut),planName: "Leg day", exercises: .constant(PreviewData.sampleExercisesA))
}

struct SetView: View {
    @State var isChecked = false
    let setName: Int
    let reps: Int
    @Binding var weight: Double
    var body: some View {
        HStack(alignment: .center,spacing: 10) {
            Button {
                isChecked.toggle()
            } label: {
                Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(isChecked ? .green : .secondary)
            }.buttonStyle(.plain)
            
            VStack(alignment: .leading) {
                Text("Set \(setName + 1)").font(.headline)
                Text("Target: \(reps) Reps")
            }
            
            Spacer()
            
            Picker("Weight:", selection: $weight) {
                ForEach(Array(stride(from: 10.0, through: 200.0, by: 5)), id: \.self) { weight in
                    Text(String(format: "%.2f LB", weight)).tag(weight)
                }
            }.pickerStyle(.navigationLink)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
    }
}

#Preview {
    SetView(setName: 1, reps: 8, weight: .constant(120))
}
