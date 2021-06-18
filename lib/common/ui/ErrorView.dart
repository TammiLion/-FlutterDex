import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/ui/ClickSupport.dart';
import 'package:flutterdex/common/util/extensions.dart';
import 'package:flutterdex/generated/locale_keys.g.dart';

class ErrorView extends StatelessWidget {
  final String? text;
  final Function()? onClick;

  const ErrorView({Key? key, this.text, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [PlatformCircularProgressIndicator()];
    text?.let((it) {
      widgets.add(Text(it));
    });
    onClick?.let((it) {
      widgets.add(ClickSupport(onClick: it, child: Text(LocaleKeys.error)));
    });

    return Center(child: Column(children: widgets));
  }
}
