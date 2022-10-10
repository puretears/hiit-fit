//
//  WelcomeView.swift
//  HIITFit
//
//  Created by Mars on 2022/10/2.
//

import SwiftUI

struct WelcomeView: View {
  @State private var showHistory = false
  @Binding var selectedTab: Int
  
  var body: some View {
    ZStack {
      VStack {
        HeaderView(selectedTab: $selectedTab, titleText: NSLocalizedString("Welcome", comment: "Greeting"))
        
        Spacer()
        
        Button(NSLocalizedString("History", comment: "View user activity.")) {
          showHistory.toggle()
        }
        .padding(.bottom)
        .sheet(isPresented: $showHistory) {
          HistoryView(showHistory: $showHistory)
        }
      }
      
      VStack {
        HStack(alignment: .bottom) {
          VStack(alignment: .leading) {
            Text(NSLocalizedString("Get Fit", comment: "Invitation to exercise"))
              .font(.largeTitle)
            Text(NSLocalizedString("With high intensity interval training", comment: "Welcome slogan"))
              .font(.headline)
          }
          
          Image("step-up")
            .resizedToFill(width: 240, height: 240)
            .clipShape(Circle())
        }
        
        Button(action: {
          selectedTab = 0
        }, label: {
          HStack {
            Text(NSLocalizedString("Get Started", comment: "Let's do it."))
            Image(systemName: "arrow.right.circle")
          }
        })
        .font(.title2)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2)
        )
      }
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView(selectedTab: .constant(9))
  }
}
