import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'ListItem.freezed.dart';

@freezed
class ListItem with _$ListItem {
  const factory ListItem.item(String text) = Data;
  const factory ListItem.loading(String text) = Loading;
  const factory ListItem.error(String text) = Error;
}
