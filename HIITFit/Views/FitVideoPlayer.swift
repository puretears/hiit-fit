//
//  VideoPlayer.swift
//  HIITFit
//
//  Created by Mars on 2022/10/8.
//

import SwiftUI
import AVKit

struct FitVideoPlayer: UIViewControllerRepresentable {
  let videoUrl: URL
  
  func makeUIViewController(context: Context) -> AVPlayerViewController {
    let player = AVPlayer(url: videoUrl)
    let playerViewController = AVPlayerViewController()
    
    playerViewController.player = player
    playerViewController.showsPlaybackControls = true
    return playerViewController
  }
  
  func updateUIViewController(
    _ uiViewController: AVPlayerViewController, context: Context) {
      
  }
}
