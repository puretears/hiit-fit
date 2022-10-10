//
//  RatingView.swift
//  HIITFit
//
//  Created by Mars on 2022/10/2.
//

import SwiftUI

struct RatingView: View {
  @Environment(\.managedObjectContext) private var moc
  @FetchRequest var ratings: FetchedResults<Rating>
  
  let maxRating: Int16 = 5
  let onColor = Color.red
  let offColor = Color.gray
  let eid: Int16
  
  init(eid: Int16) {
    self.eid = eid
    _ratings = FetchRequest<Rating>(sortDescriptors: [], predicate: NSPredicate(format: "id == %i", argumentArray: [eid]))
  }
  
  var body: some View {
    HStack {
      ForEach(1..<(maxRating + 1), id: \.self) { idx in
        if !ratings.isEmpty {
          Image(systemName: "waveform.path.ecg")
            .foregroundColor(idx <= ratings[0].score ? onColor : offColor)
            .font(.largeTitle)
            .onTapGesture {
              moc.performAndWait {
                ratings[0].score = idx
                try? moc.save()
              }
            }
        }
        else {
          Image(systemName: "waveform.path.ecg")
            .foregroundColor(offColor)
            .font(.largeTitle)
            .onTapGesture {
              let r = Rating(context: moc)
              r.id = eid
              r.score = idx
              
              moc.performAndWait {
                try? moc.save()
              }
            }
        }
        
      }
    }
  }
}

//struct RatingView_Previews: PreviewProvider {
//  static var previews: some View {
//    RatingView(rating: .constant(3))
//  }
//}
