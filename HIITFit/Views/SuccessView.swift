//
//  SuccessView.swift
//  HIITFit
//
//  Created by Mars on 2022/10/4.
//

import SwiftUI

struct SuccessView: View {
  @Environment(\.presentationMode) var presentationMode
  @Binding var selectedTab: Int
  
  var body: some View {
    ZStack {
      VStack(spacing: 20) {
        Image(systemName: "hand.thumbsup.fill")
          .resizedToFill(width: 75, height: 75)
          .foregroundColor(.purple)
        
        Text(NSLocalizedString("High Five", comment: "Congrats"))
          .font(.title)
          .fontWeight(.heavy)
        
        VStack(spacing: 5) {
          Text(
            NSLocalizedString("Good job completing all four exercises!", comment: "What's next")
          )
          Text(
            NSLocalizedString("Remember tomorrow's another day.", comment: "")
          )
          Text(
            NSLocalizedString("So eat well and get some rest.", comment: "")
          )
        }
        .foregroundColor(.gray)
      }
      
      VStack {
        Spacer()
        
        Button(action: {
          presentationMode.wrappedValue.dismiss()
          selectedTab = 9
        }, label: {
          Text(NSLocalizedString("Continue", comment: ""))
        })
        .padding(.bottom)
      }
      
    }
  }
}

struct SuccessView_Previews: PreviewProvider {
  static var previews: some View {
    SuccessView(selectedTab: .constant(9))
  }
}
