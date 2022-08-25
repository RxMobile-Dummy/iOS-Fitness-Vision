//
//  CameraViewWrapper.swift
//  FitnessVision
//
//  Created by Devangi Prajapati on 24/08/22.
//

import Foundation
import SwiftUI
import AVFoundation
import Vision

struct CameraViewWrapper : UIViewControllerRepresentable {

  var poseEstimator : PoseEstimator

  func makeUIViewController(context: Context) -> some UIViewController {
    let cvc = CameraViewController()
    cvc.delegate = poseEstimator
    return cvc
  }

  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }

}
