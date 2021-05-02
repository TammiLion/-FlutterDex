import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/ui/CustomPlatformText.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: CustomPlatformText(id ?? "missingno"),
      ),
      body: Container(),
    );
  }
}
