//
//  CameraViewController.swift
//  FitnessVision
//
//  Created by Devangi Prajapati on 24/08/22.
//

import UIKit
import AVFoundation
import AVKit
import Vision

class CameraViewController: UIViewController {

  private var cameraSession : AVCaptureSession?
  var delegate : AVCaptureVideoDataOutputSampleBufferDelegate?

  private let cameraQueue = DispatchQueue(label: "CameraOutput", qos: .userInteractive)


  private var cameraView : CameraView {
    view as! CameraView
  }

  override func loadView() {
    view = CameraView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
//    // Do any additional setup after loading the view.
//    // Get the CGImage on which to perform requests.
//    guard let cgImage = UIImage(named: "img_man")?.cgImage else { return }
//
//    // Create a new image-request handler.
//    let requestHandler = VNImageRequestHandler(cgImage: cgImage)
//
//    // Create a new request to recognize a human body pose.
//    let request = VNDetectHumanBodyPoseRequest(completionHandler: bodyPoseHandler)
//
//    do {
//        // Perform the body pose-detection request.
//        try requestHandler.perform([request])
//    } catch {
//        print("Unable to perform the request: \(error).")
//    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    do {
      if cameraSession == nil {
        try prepareAVSession()
        cameraView.previewLayer.session = cameraSession
        cameraView.previewLayer.videoGravity = .resizeAspectFill
      }
      cameraSession?.startRunning()
    } catch {
      print(error.localizedDescription)
    }
  }

  override func viewWillDisappear(_ animated: Bool) {
   // cameraSession?.stopRunning()
    super.viewWillDisappear(animated)
  }

  func prepareAVSession() throws {
    let session = AVCaptureSession()
    session.beginConfiguration()
    session.sessionPreset = AVCaptureSession.Preset.high
    guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    else {
      return
    }
    guard let deviceInput = try? AVCaptureDeviceInput(device: videoDevice)
    else {
      return
    }
    guard session.canAddInput(deviceInput)
    else {
      return
    }
    session.addInput(deviceInput)
    let dataOutput = AVCaptureVideoDataOutput()
    if session.canAddOutput(dataOutput) {
      session.addOutput(dataOutput)
      dataOutput.setSampleBufferDelegate(delegate, queue: cameraQueue)
    } else {
      return
    }
    session.commitConfiguration()
    cameraSession = session
  }

  /*func bodyPoseHandler(request: VNRequest, error: Error?) {
      guard let observations =
              request.results as? [VNHumanBodyPoseObservation] else {
          return
      }

      // Process each observation to find the recognized body pose points.
      observations.forEach { processObservation($0) }
  }

  func processObservation(_ observation: VNHumanBodyPoseObservation) {

      // Retrieve all torso points.
      guard let recognizedPoints =
              try? observation.recognizedPoints(.torso) else { return }

      // Torso joint names in a clockwise ordering.
      let torsoJointNames: [VNHumanBodyPoseObservation.JointName] = [
          .neck,
          .rightShoulder,
          .rightHip,
          .root,
          .leftHip,
          .leftShoulder
      ]

      // Retrieve the CGPoints containing the normalized X and Y coordinates.
      let imagePoints: [CGPoint] = torsoJointNames.compactMap {
          guard let point = recognizedPoints[$0], point.confidence > 0 else { return nil }

          // Translate the point from normalized-coordinates to image coordinates.
          return VNImagePointForNormalizedPoint(point.location,
                                                Int(imageSize.width),
                                                Int(imageSize.height))
      }

      // Draw the points onscreen.
      draw(points: imagePoints)
  }*/

}
