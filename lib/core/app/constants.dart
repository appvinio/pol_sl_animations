abstract class HiveObjects {}

abstract class RegExpPreset {
  /// Letters and numbers
  static const password = r'^(?=.*[a-zA-Z])(?=.*\d).*$';
  static const email = r'^[\w\.]+@(([\w-]+\.)[\w]*).*$';
}

abstract class Constants {}
