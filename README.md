# Image App-Unsplash
 A simple iOS app that allows users to keep their favorite images from Unsplash

![Platform](https://img.shields.io/badge/Platform-iOS-orange.svg)
![Languages](https://img.shields.io/badge/Language-Swift-orange.svg)

Image App-Unsplash is a demo app for dating.

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To run the project:
- Open terminal
- `cd` into your top-level project directory
- Run the followinfg command: pod install
- After installing the pods build the app and run it.
- You will see a login validation screen enter username and password any characters > 3 and then you will be redirect to image feed view.

## Demo
![](palmu1.gif)
![](palmu2.gif)

## Requirements

- iOS 13.0+
- Xcode 11+
- Swift 5+


## Features

- [x] Used GitHub for version control(you can check the git version history)
- [x] Unsplash Images API Using Pagination
- [x] Card View For Images
- [x] A dedicated screen to view liked images
- [x] URL / JSON Parameter Encoding
- [x] FireStore Integration as a backend DB to store liked images
- [x] Download Images using AlamofireImage
- [x] Network Requests using Alamofire

### Cool Features
- [x] Login screen for user authentication
- [x] Like Swipe View
- [x] Swipe Right To Like An Image
- [x] Swipe Left To Skip An Image

## Design Pattern: Model-View-ViewModel (MVVM)
is a structural design pattern that separates objects into three distinct groups:
- #### Models 
  - hold application data. They’re usually structs or simple classes.
- #### Views 
  - display visual elements and controls on the screen. They’re typically subclasses of UIView.
- #### View models
  - transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.

## Dependencies

- [Koloda](https://github.com/Yalantis/Koloda)
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [AlamofireImage](https://github.com/Alamofire/AlamofireImage)
- [Firebase/Firestore](https://firebase.google.com/docs/ios/setup)
- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [RxCocoa](https://github.com/ReactiveX/RxSwift)

### Improvements

- User authentication using Firebase.
- Display a empty image or logo for no data.
- No Internet Connectivity Handling
- Add a button to undo swipe card action
- Preview liked image with details in full screen

### Todos
 - will update Api calls to Rxswift.

