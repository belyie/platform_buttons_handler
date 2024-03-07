import Flutter
import UIKit

public class PlatformButtonsHandlerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "platform_buttons_handler", binaryMessenger: registrar.messenger())
    let eventChannel:FlutterEventChannel = FlutterEventChannel(name: "on_button_tap", binaryMessenger: registrar.messenger())

    let instance = PlatformButtonsHandlerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

     @IBAction func systemButtonTapped(_ sender: Any) {
         if let button = sender as? UIButton {
         print(button.tag);
             if button.tag == 1 {
                 // Здесь код для обработки нажатия кнопки 1
             } else if button.tag == 2 {
                 // Здесь код для обработки нажатия кнопки 2
             }
         }
     }

}
