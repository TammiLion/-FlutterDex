import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClickSupport extends StatelessWidget {

  final Function() onClick;
  final Widget child;

  const ClickSupport({Key? key, required this.onClick, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return GestureDetector(
        onTap: onClick,
        child: child,
      );
    } else {
      return InkWell(
        onTap: onClick,
        child: child,
      );
    }
  }
}