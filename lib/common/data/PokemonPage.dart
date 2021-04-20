import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdex/common/network/data/NamedApiResource.dart';

part 'PokemonPage.freezed.dart';
part 'PokemonPage.g.dart';

@freezed
class PokemonPage with _$PokemonPage {
  factory PokemonPage({int? count, String? next, String? previous, List<NamedApiResource>? results}) = _PokemonPage;
  
  factory PokemonPage.fromJson(Map<String, dynamic> json) => _$PokemonPageFromJson(json);
}