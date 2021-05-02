import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

String formatData(
    String data, bool? capitalizeFirst, bool? upperCase, bool? lowerCase) {
  if (capitalizeFirst == true) {
    data = data.substring(0, 1).toUpperCase() + data.substring(1, data.length);
  }

  if (upperCase == true) {
    data = data.toUpperCase();
  }

  if (lowerCase == true) {
    data = data.toLowerCase();
  }

  return data;
}

typedef Text _TextBuilder(BuildContext context);

class CustomPlatformText extends StatelessWidget {
  final _TextBuilder _textBuilder;

  CustomPlatformText._(Key? key, this._textBuilder) : super(key: key);

  factory CustomPlatformText(
    String data, {
    Key? key,
    bool? capitalizeFirst,
    bool? upperCase,
    bool? lowerCase,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis,
    ui.TextHeightBehavior? textHeightBehavior,
  }) {
    return CustomPlatformText._(
        key,
        (BuildContext context) => Text(
              formatData(data, capitalizeFirst, upperCase, lowerCase),
              key: key,
              style: style,
              textAlign: textAlign,
              textDirection: textDirection,
              softWrap: softWrap,
              overflow: overflow,
              textScaleFactor: textScaleFactor,
              maxLines: maxLines,
              locale: locale,
              semanticsLabel: semanticsLabel,
              strutStyle: strutStyle,
              textWidthBasis: textWidthBasis,
              textHeightBehavior: textHeightBehavior,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return _textBuilder(context);
  }
}
