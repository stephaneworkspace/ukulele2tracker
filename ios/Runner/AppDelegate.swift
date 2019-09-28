import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// coded for X Code 9 -> for 10 and upper : https://stackoverflow.com/questions/50794391/ios-app-xcode-build-errors UIApplication.LaunchOptionsKey -> UIApplicationLaunchOptionsKey