//
//  CameraView.swift
//  FitnessVision
//
//  Created by Devangi Prajapati on 24/08/22.
//

import UIKit
import AVKit

class CameraView: UIView {

  override class var layerClass: AnyClass {
    AVCaptureVideoPreviewLayer.self
  }
  var previewLayer: AVCaptureVideoPreviewLayer {
    layer as! AVCaptureVideoPreviewLayer
  }
}
