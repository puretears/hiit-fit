//
//  HIITFitTests.swift
//  HIITFitTests
//
//  Created by Mars on 2022/10/6.
//

import XCTest
@testable import HIITFit

final class HIITFitTests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testExerciseEncoding() throws {
    let exec = Exercise(name: String(describing: Exercise.Action.squat), video: "squat")
    let data = try? JSONEncoder().encode(exec)
    
    if let data = data {
      let encoded = String(decoding: data , as: UTF8.self)
      print(encoded)
      
      XCTAssert(encoded != "")
      
      let e = try? JSONDecoder().decode(Exercise.self, from: data)
      
      if let e = e {
        print(e.name)
      }
    }
  }
}
