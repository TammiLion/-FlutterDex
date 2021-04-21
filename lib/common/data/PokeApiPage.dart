import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdex/common/network/data/NamedApiResource.dart';

part 'PokeApiPage.freezed.dart';
part 'PokeApiPage.g.dart';

@freezed
class PokeApiPage with _$PokeApiPage {
  factory PokeApiPage({int? count, int? offset, String? next, String? previous, List<NamedApiResource>? results}) = _PokeApiPage;

  factory PokeApiPage.fromJson(Map<String, dynamic> json) => _$PokeApiPageFromJson(json);
}