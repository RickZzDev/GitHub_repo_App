import 'dart:io';

abstract class Headers {
  static Map<String, String> getBasicHeader() => {
        "OS": Platform.isAndroid ? "Android" : "iOS",
        "Content-Type": "application/json",
      };
}
