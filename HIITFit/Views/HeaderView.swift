//
//  HeaderView.swift
//  HIITFit
//
//  Created by Mars on 2022/10/2.
//

import SwiftUI

struct HeaderView: View {
  @Binding var selectedTab: Int
  let titleText: String
  
  var body: some View {
    VStack {
      Text(titleText)
        .font(.largeTitle)
      
      HStack {
        Image(systemName: "hand.wave")
        
        ForEach(0..<Exercise.exercises.count, id: \.self) { idx in
          let fill = idx == selectedTab ? ".fill" : ""
          Image(systemName: "\(idx + 1).circle\(fill)")
            .onTapGesture {
              selectedTab = idx
            }
        }
      }
      .font(.title2)
    }
    
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(selectedTab: .constant(0), titleText: "Squat")
         
//    HeaderView(titleText: "Squat")
//      .preferredColorScheme(.dark)
//      .environment(\.sizeCategory, .accessibilityLarge)
  }
}
