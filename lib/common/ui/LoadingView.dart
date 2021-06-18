import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/util/extensions.dart';

class LoadingView extends StatelessWidget {
  final String? text;

  const LoadingView({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [PlatformCircularProgressIndicator()];
    text?.let((it) {
      widgets.add(Text(it));
    });

    return Center(child: Column(children: widgets));
  }
}
