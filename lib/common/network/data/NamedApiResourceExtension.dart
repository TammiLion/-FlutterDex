import 'NamedApiResource.dart';

extension NamedApiResourceExtension on NamedApiResource {
  bool isComplete() {
    return name != null && url != null;
  }
}