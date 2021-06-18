import 'package:flutterdex/home/presentation/uimodel/ListItem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'HomeState.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.list(List<ListItem> list) = Data;
  const factory HomeState.loading(String text) = Loading;
  const factory HomeState.error(String text) = Error;
}

