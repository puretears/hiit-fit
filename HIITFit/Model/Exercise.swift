//
//  Exercise.swift
//  HIITFit
//
//  Created by Mars on 2022/10/4.
//

import Foundation

struct Exercise: Hashable, Identifiable, Codable {
  let id: Int16
  let name: String
  let video: String
  let url: URL
  
  // Enumeration's raw value must be string literal.
  enum Action: CustomStringConvertible {
    case squat
    case stepUp
    case burpee
    case sunSalute
    
    var description: String {
      switch self {
      case .squat:
        return NSLocalizedString("Squat", comment: "Exercise name")
      case .stepUp:
        return NSLocalizedString("Step Up", comment: "Exercise name")
      case .burpee:
        return NSLocalizedString("Burpee", comment: "Exercise name")
      case .sunSalute:
        return NSLocalizedString("Sun Salute", comment: "Exercise name")
      }
      
    }
  }
}

extension Exercise {
  static let exercises = [
    Exercise(
      id: 1, name: String(describing: Action.squat),
      video: "squat",
      url: URL(string: "https://free-video.boxueio.com/squat-v1.mp4")!),
    Exercise(
      id: 2, name: String(describing: Action.stepUp),
      video: "step-up",
      url: URL(string: "https://free-video.boxueio.com/step-up-v1.mp4")!),
    Exercise(
      id: 3, name: String(describing: Action.burpee),
      video: "burpee",
      url: URL(string: "https://free-video.boxueio.com/burpee-v1.mp4")!),
    Exercise(
      id: 4, name: String(describing: Action.sunSalute),
      video: "sun-salute",
      url: URL(string: "https://free-video.boxueio.com/sun-salute-v1.mp4")!)
  ]
}
