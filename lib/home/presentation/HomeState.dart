import 'package:flutterdex/common/network/data/NetworkResource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'HomeState.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({NetworkResource<List<String>>? resource}) = _HomeState;
}
