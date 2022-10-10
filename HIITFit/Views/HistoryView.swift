//
//  HistoryView.swift
//  HIITFit
//
//  Created by Mars on 2022/10/3.
//

import SwiftUI
extension Date {
  func formatted(as format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }
}

struct HistoryView: View {
  @Binding var showHistory: Bool
  
  @FetchRequest<History>(sortDescriptors: [SortDescriptor(\.date, order: .reverse)])
  var histories: FetchedResults<History>
  
  var body: some View {
    VStack {
      HistoryHeaderView(showHistory: _showHistory)
      
      if histories.isEmpty {
        VStack {
          Spacer()
          
          Image(systemName: "square.and.pencil")
            .resizedToFill(width: 64, height: 64)
            .foregroundColor(.orange)
            .padding(.bottom, 10)
            
          Text(NSLocalizedString("The history list is empty.", comment: "No history record prompt"))
            .foregroundColor(.gray)
          
          Spacer()
        }
      }
      else {
        Form {
          ForEach(histories) { record in
            Section {
              ForEach(decodeData(str: record.exercises!)) { exer in
                Text(exer.name)
              }
            } header: {
              Text(record.date!.formatted(as: "MMM d")).font(.headline)
            }
          }
        } // End Form
      }
      
    } // End VStack
  }
  
  func decodeData(str: String) -> [Exercise] {
    let arr = try! JSONDecoder().decode([Exercise].self, from: Data(str.utf8))
    return arr
  }
}

struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryView(showHistory: .constant(true))
      .environmentObject(HistoryStore())
  }
}

struct HistoryHeaderView: View {
  @Binding var showHistory: Bool
  
  var body: some View {
    ZStack {
      HStack {
        Spacer()
        
        Text(NSLocalizedString("History", comment: "View user activity."))
          .font(.title)
          .padding()
        
        Spacer()
      }
      
      HStack {
        Spacer()
        
        Button(action: {
          showHistory.toggle()
        }) {
          Image(systemName: "xmark.circle")
        }
        .font(.title)
        .padding(.trailing)
      }
    }
  }
}
