import 'dart:async';

import 'package:flutter/services.dart';

class PhotokredyCore {
  static const MethodChannel _channel =
      const MethodChannel('photokredy_core');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}