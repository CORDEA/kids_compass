import CoreLocation
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, CLLocationManagerDelegate {
    var eventSink: FlutterEventSink?
    let locationManager = CLLocationManager()

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        locationManager.delegate = self
        locationManager.headingFilter = 1.0
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        eventSink?(newHeading.magneticHeading)
    }
}

extension AppDelegate: FlutterStreamHandler {
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        locationManager.startUpdatingHeading()
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        locationManager.stopUpdatingHeading()
        eventSink = nil
        return nil
    }
}
