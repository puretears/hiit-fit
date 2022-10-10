//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Mars on 2022/10/4.
//

import Foundation

struct ExerciseRecord: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [Exercise]
}

class HistoryStore: ObservableObject {
  @Published var exerciseRecords: [ExerciseRecord] = []
  
  init() {
    #if DEBUG
    createDevData()
    #endif
  }
  
  func addExerciseRecord(exercise: Exercise) {
    let today = Date()
    
    if today.isSameDay(exerciseRecords[0].date) {
      exerciseRecords[0].exercises.append(exercise)
    }
    else {
      exerciseRecords.insert(
        ExerciseRecord(date: today, exercises: [exercise]),
        at: 0)
    }
  }
}
