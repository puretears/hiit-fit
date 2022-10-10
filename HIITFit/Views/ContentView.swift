//
//  ContentView.swift
//  HIITFit
//
//  Created by Mars on 2022/10/2.
//
import AVKit
import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 9
  
  var body: some View {
    TabView(selection: $selectedTab) {

      WelcomeView(selectedTab: $selectedTab)
        .tag(9)

      ForEach(0..<Exercise.exercises.count, id: \.self) {
        ExerciseView(selectedTab: $selectedTab, exercise: Exercise.exercises[$0])
          .tag($0)
      }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .environmentObject(HistoryStore())
    .onAppear {
      print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
