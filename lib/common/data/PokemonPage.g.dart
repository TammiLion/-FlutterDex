// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PokemonPage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonPage _$_$_PokemonPageFromJson(Map<String, dynamic> json) {
  return _$_PokemonPage(
    count: json['count'] as int?,
    next: json['next'] as String?,
    previous: json['previous'] as bool?,
    results: (json['results'] as List<dynamic>?)
        ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_PokemonPageToJson(_$_PokemonPage instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
