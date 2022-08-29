# Project Title

iOS-Fitness-Vision

# Contents Of This File

* Introduction

* Installation

* Features

* App UI

# Introduction

During the pandemic, the at-home fitness industry has been booming, so our app will be a sort of home workout mirror that counts squat repetitions and provides useful clues regarding our posture.

# Installation

Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services.

1. Clone the repo

   ```sh

   https://github.com/RxMobile-Dummy/iOS-Fitness-Vision.git

   ```

2. Install packages

   ```sh

   pod install

   ```
   
# Features
- We have using Apple’s Vision framework to detect human body poses. 
- We implements captureOutput to conform to AVCaptureVideoDataOutputSampleBufferDelegate and recognize position of 19 predefined body points.

![1_LZhQ1yeACJqy1UtgMFJ4dw](https://user-images.githubusercontent.com/88186302/187166976-d643caf9-162c-4018-bbef-d67acca24ec3.jpeg)

- We have displayed a Stick figure from the body points and lay it over the camera view.
- Count squats and check body posture.

# App UI

This app only works on iOS 14.0
|||
|:--:|:--:|
![1_g6eEb4sIYHDjbYhvVakbiQ](https://user-images.githubusercontent.com/88186302/187167023-64436674-6e45-4244-8b77-26402d60b13c.gif) | ![Squats2](https://user-images.githubusercontent.com/88186302/187168336-43a125da-6b64-4472-ae84-19b48da06191.gif)


