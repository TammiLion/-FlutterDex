import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'HomeEvent.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent(int position) = PokemonClicked;

  const factory HomeEvent.startOfPage() = StartOfPage;

  const factory HomeEvent.endOfPage() = EndOfPage;
}
