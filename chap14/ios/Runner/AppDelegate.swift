import Flutter
import UIKit

// (1) Import Google Maps
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // (2) Register Google Maps API Key
    GMSService.providedAPIKey("AIzaSyDl7ex6vTpgrF8jIn2wt6QPj7wfv-Yvhrg")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
