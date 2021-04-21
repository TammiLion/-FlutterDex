import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Pokemon.freezed.dart';
part 'Pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const Pokemon._();

  factory Pokemon({int? id, String? name}) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  bool isComplete() {
    return name != null;
  }
}
