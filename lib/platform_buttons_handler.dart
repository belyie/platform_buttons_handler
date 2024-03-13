import 'platform_buttons_handler_platform_interface.dart';

class PlatformButtonsHandler {
  Future<String?> getPlatformVersion() {
    return PlatformButtonsHandlerPlatform.instance.getPlatformVersion();
  }
}
