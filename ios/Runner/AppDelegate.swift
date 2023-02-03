import UIKit
import Flutter
import GoogleMaps  // Add this import


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)

      // TODO: Add your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyDcDrkItrqO97lOz22LCVnMTCSnaLsIZf4")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
