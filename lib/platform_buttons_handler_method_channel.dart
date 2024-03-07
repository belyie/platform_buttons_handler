import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'key_code.dart';
import 'platform_buttons_handler_platform_interface.dart';

/// An implementation of [PlatformButtonsHandlerPlatform] that uses method channels.
class MethodChannelPlatformButtonsHandler
    extends PlatformButtonsHandlerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_button_handler');

  static const EventChannel _volumeEventChannel = EventChannel('on_button_tap');

  static Stream<KeyCode> get onButtonTap =>
      _volumeEventChannel.receiveBroadcastStream().map((e) {
        final i = int.tryParse(e.toString());
        return KeyCode.fromInt(i);
      });

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
