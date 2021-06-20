import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdex/common/ui/ClickSupport.dart';
import 'package:flutterdex/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorView extends StatelessWidget {
  final String? text;
  final Function()? onClick;

  const ErrorView({Key? key, this.text, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onClick == null) {
      return _error();
    } else {
      return ClickSupport(onClick: onClick!, child: _error());
    }
  }

  Widget _error() {
    return Center(
        child: Column(
            children: [Icon(Icons.error), Text(text ?? LocaleKeys.retry.tr())]));
  }
}
