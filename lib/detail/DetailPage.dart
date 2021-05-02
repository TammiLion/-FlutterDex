import 'package:flutter/widgets.dart';
import 'package:flutterdex/common/ui/CustomPlatformText.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPlatformText(id ?? "missingno"),
    );
  }
}
