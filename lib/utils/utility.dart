import 'dart:convert';
import 'dart:typed_data';

class Utility {
  static Uint8List converToUnit8List(String appIconBase64) {
    return base64.decode(appIconBase64.replaceAll(RegExp(r'\s'), ''));
  }
}
