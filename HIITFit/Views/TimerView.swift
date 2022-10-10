//
//  TimerView.swift
//  HIITFit
//
//  Created by Mars on 2022/10/4.
//

import SwiftUI

struct TimerView: View {
  @State private var timeRemaining = 3
  @Binding var timeUp: Bool
  
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
      Text("\(timeRemaining)")
      .font(.system(size: 90, design: .rounded))
      .padding()
      .onReceive(timer) { _ in
        if self.timeRemaining > 0 {
          self.timeRemaining -= 1
        }
        else {
          self.timeUp = true
        }
      }
  }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
      TimerView(timeUp: .constant(false))
    }
}
