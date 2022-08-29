//
//  SampleView.swift
//  FitnessVision
//
//  Created by Devangi Prajapati on 24/08/22.
//

import SwiftUI
import AVFoundation
import AVKit
import Vision

struct MainView: View {

  @StateObject var poseEstimator = PoseEstimator()

  var body: some View {
    VStack {
      ZStack {
        GeometryReader { geo in
          CameraViewWrapper(poseEstimator: poseEstimator)
          StickFigureView(poseEstimator: poseEstimator, size: geo.size)
        }
      }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 1920 / 1080, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
      HStack {
        Text("Squat counter:")
          .font(.title)
        Text(String(poseEstimator.squatCount))
          .font(.title)
        Image(systemName: "exclamationmark.triangle.fill")
          .font(.largeTitle)
          .foregroundColor(Color.red)
          .opacity(poseEstimator.isGoodPosture ? 0.0 : 1.0)
      }
    }
  }
}
