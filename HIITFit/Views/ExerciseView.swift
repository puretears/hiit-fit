//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Mars on 2022/10/2.
//
import AVKit
import SwiftUI
import CoreData
import BXVideoPlayer

struct ExerciseView: View {
  @State private var showHistory = false
  @State private var showSuccess = false
  @State private var timeUp = false
  @State private var showTimer = false
  
  @StateObject var model: VideoModel
  
  @Binding var selectedTab: Int
  
  @EnvironmentObject var history: HistoryStore
  
  @Environment(\.managedObjectContext) private var moc
  @FetchRequest<History>(sortDescriptors: [SortDescriptor(\.date, order: .reverse)])
  var histories: FetchedResults<History>
  
  let exercise: Exercise
  
  var isLastExercise: Bool {
    selectedTab == (Exercise.exercises.count - 1)
  }
  
  init(selectedTab: Binding<Int>, exercise: Exercise) {
    self._selectedTab = selectedTab
    self.exercise = exercise
    
    self._model = StateObject(
      wrappedValue: VideoModel(url: exercise.url, title: exercise.name)
    )
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(selectedTab: $selectedTab, titleText: exercise.name)
          .padding(.bottom)
        
        BXVideoPlayer(model: model, showsControlPannel: false)
          .frame(height: geometry.size.width / model.ratio)
        
        
        HStack(spacing: 20) {
          Button(action: {
            showTimer = true
          }, label: {
            Text("Start Exercise")
          })
          
          Button(action: {
            history.addExerciseRecord(exercise: exercise)
            
            addHistory(exercise: exercise)
            
            timeUp = false
            showTimer = false
            
            if isLastExercise {
              showSuccess.toggle()
            }
            else {
              selectedTab += 1
            }
          }, label: {
            Text("Done")
          })
          .disabled(!timeUp)
          .sheet(isPresented: $showSuccess) {
            SuccessView(selectedTab: _selectedTab)
          }
        }
        .font(.title3)
        
        RatingView(eid: exercise.id)
          .padding()
        
        if showTimer {
          TimerView(timeUp: $timeUp)
        }
        
        Spacer()
        Button(NSLocalizedString("History", comment: "View user activity.")) {
          showHistory.toggle()
        }
        .padding(.bottom)
        .sheet(isPresented: $showHistory) {
          HistoryView(showHistory: $showHistory)
        }
      }
    }
  }
}

extension ExerciseView {
  func addHistory(exercise: Exercise) {
    if histories.isEmpty || !histories[0].date!.isSameDay(Date()) {
      let h = History(context: moc)
      h.date = Date()
      
      guard let actions = try? JSONEncoder().encode([exercise]) else {
        return
      }
      
      h.exercises = String(decoding: actions, as: UTF8.self)
      moc.performAndWait {
        try? moc.save()
      }
    }
    else {
      guard var actions = try? JSONDecoder().decode(
        [Exercise].self,
        from: Data(histories[0].exercises!.utf8)) else {
        return
      }
      
      actions.append(exercise)
      
      guard let data = try? JSONEncoder().encode(actions) else {
        return
      }
      
      let str = String(decoding: data, as: UTF8.self)
      
      moc.performAndWait {
        histories[0].exercises = str
        try? moc.save()
      }
    }
  }
}

struct ExerciseView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseView(selectedTab: .constant(1), exercise: Exercise.exercises[0])
      .environmentObject(HistoryStore())
  }
}
