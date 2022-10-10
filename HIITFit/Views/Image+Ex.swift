//
//  Image+Ex.swift
//  HIITFit
//
//  Created by Mars on 2022/10/3.
//

import SwiftUI

extension Image {
  func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
    return self
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: width, height: height)
  }
}
