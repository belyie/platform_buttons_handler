package com.beliya.platform_buttons_handler

import android.os.Build

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** PlatformButtonsHandlerPlugin */
class PlatformButtonsHandlerPlugin: FlutterPlugin, MethodCallHandler {
  private val channel = "platform_button_handler"

  var events: EventChannel.EventSink? = null
  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(
      flutterEngine.dartExecutor.binaryMessenger,
      channel
    ).setMethodCallHandler { call, result ->
      if (call.method == "test") {
        result.success(0)
      } else {
        result.notImplemented()
      }
    }

    EventChannel(flutterEngine.dartExecutor.binaryMessenger, "on_button_tap").setStreamHandler(
      object : EventChannel.StreamHandler {
        override fun onListen(arguments: Any?, es: EventChannel.EventSink?) {
          events = es
          events?.success(arguments)
        }

        override fun onCancel(arguments: Any?) {
        }
      }
    )
  }

  override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
    if (keyCode == KeyEvent.KEYCODE_POWER) {
      events?.success(keyCode)
    }

    if (keyCode == KeyEvent.KEYCODE_HOME) {
      events?.success(keyCode)
    }

    if (keyCode == KeyEvent.KEYCODE_MENU) {
      events?.success(keyCode)
    }

    if (keyCode == KeyEvent.KEYCODE_BACK) {
      events?.success(keyCode)
    }

    if (keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
      events?.success(keyCode)
    }

    if (keyCode == KeyEvent.KEYCODE_VOLUME_UP) {
      events?.success(keyCode)
    }

    return super.onKeyDown(keyCode, event)
  }

  fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "platform_buttons_handler")
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
