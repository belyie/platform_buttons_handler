import 'package:flutter_test/flutter_test.dart';
import 'package:platform_buttons_handler/platform_buttons_handler.dart';
import 'package:platform_buttons_handler/platform_buttons_handler_platform_interface.dart';
import 'package:platform_buttons_handler/platform_buttons_handler_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformButtonsHandlerPlatform
    with MockPlatformInterfaceMixin
    implements PlatformButtonsHandlerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  onPlatformButtonPressed() {
    throw UnimplementedError();
  }
}

void main() {
  final PlatformButtonsHandlerPlatform initialPlatform =
      PlatformButtonsHandlerPlatform.instance;

  test('$MethodChannelPlatformButtonsHandler is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelPlatformButtonsHandler>());
  });

  test('getPlatformVersion', () async {
    PlatformButtonsHandler platformButtonsHandlerPlugin =
        PlatformButtonsHandler();
    MockPlatformButtonsHandlerPlatform fakePlatform =
        MockPlatformButtonsHandlerPlatform();
    PlatformButtonsHandlerPlatform.instance = fakePlatform;

    expect(await platformButtonsHandlerPlugin.getPlatformVersion(), '42');
  });
}
