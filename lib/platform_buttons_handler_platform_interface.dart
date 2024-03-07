import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_buttons_handler_method_channel.dart';

abstract class PlatformButtonsHandlerPlatform extends PlatformInterface {
  /// Constructs a PlatformButtonsHandlerPlatform.
  PlatformButtonsHandlerPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformButtonsHandlerPlatform _instance =
      MethodChannelPlatformButtonsHandler();

  /// The default instance of [PlatformButtonsHandlerPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformButtonsHandler].
  static PlatformButtonsHandlerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformButtonsHandlerPlatform] when
  /// they register themselves.
  static set instance(PlatformButtonsHandlerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    return _instance.getPlatformVersion();
    // throw UnimplementedError('platformVersion() has not been implemented.');
  }

  onPlatformButtonPressed() {
    return _instance.onPlatformButtonPressed();
  }
}
