import 'package:flutter/material.dart';

final Color gold = HexColor.fromHex("e7b976");
final Color mutedGold = HexColor.fromHex("5d5244");
final Color black = HexColor.fromHex("1b1a1d");
final Color offblack = HexColor.fromHex("232227");
final Color white = HexColor.fromHex("ffffff");
final Color offwhite = HexColor.fromHex("f1faee");
final Color altBrown = HexColor.fromHex("545749");
final Color grey = HexColor.fromHex("38373e");
final Color darkGrey = HexColor.fromHex("2f2e33");
final Color lightGrey = HexColor.fromHex("555557");

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
