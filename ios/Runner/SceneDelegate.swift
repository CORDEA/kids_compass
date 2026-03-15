import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {
    private let channelName = "jp.cordea.kids.compass/heading"

    override func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        super.scene(scene, willConnectTo: session, options: connectionOptions)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let controller = window!.rootViewController as! FlutterViewController
        FlutterEventChannel(name: channelName, binaryMessenger: controller.binaryMessenger)
            .setStreamHandler(appDelegate)
    }
}
