//
//  HistoryStoreDevData.swift
//  HIITFit
//
//  Created by Mars on 2022/10/4.
//

import Foundation

extension HistoryStore {
  func createDevData() {
    exerciseRecords = [
      ExerciseRecord(date: Date().addingTimeInterval(-86400), exercises: [
        Exercise.exercises[0],
        Exercise.exercises[1],
        Exercise.exercises[2]
      ]),
      ExerciseRecord(date: Date().addingTimeInterval(-86400 * 2), exercises: [
        Exercise.exercises[1],
        Exercise.exercises[0]
      ])
    ]
  }
}
