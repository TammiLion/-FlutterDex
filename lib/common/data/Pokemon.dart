import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'Pokemon.freezed.dart';
part 'Pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({int? id, String? name}) = _Pokemon;
  
  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}