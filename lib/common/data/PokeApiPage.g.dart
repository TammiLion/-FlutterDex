// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PokeApiPage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokeApiPage _$_$_PokeApiPageFromJson(Map<String, dynamic> json) {
  return _$_PokeApiPage(
    count: json['count'] as int?,
    offset: json['offset'] as int?,
    next: json['next'] as String?,
    previous: json['previous'] as String?,
    results: (json['results'] as List<dynamic>?)
        ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_PokeApiPageToJson(_$_PokeApiPage instance) =>
    <String, dynamic>{
      'count': instance.count,
      'offset': instance.offset,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
