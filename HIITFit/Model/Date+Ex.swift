//
//  Date+Ex.swift
//  HIITFit
//
//  Created by Mars on 2022/10/5.
//

import Foundation

extension Date {
  func isSameDay(_ to: Date) -> Bool {
    let diff = Calendar.current.dateComponents([.day], from: self, to: to)
    
    return diff.day == 0
  }
}
