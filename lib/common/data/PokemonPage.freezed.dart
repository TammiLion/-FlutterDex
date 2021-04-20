// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'PokemonPage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonPage _$PokemonPageFromJson(Map<String, dynamic> json) {
  return _PokemonPage.fromJson(json);
}

/// @nodoc
class _$PokemonPageTearOff {
  const _$PokemonPageTearOff();

  _PokemonPage call(
      {int? count,
      String? next,
      String? previous,
      List<NamedApiResource>? results}) {
    return _PokemonPage(
      count: count,
      next: next,
      previous: previous,
      results: results,
    );
  }

  PokemonPage fromJson(Map<String, Object> json) {
    return PokemonPage.fromJson(json);
  }
}

/// @nodoc
const $PokemonPage = _$PokemonPageTearOff();

/// @nodoc
mixin _$PokemonPage {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<NamedApiResource>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonPageCopyWith<PokemonPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonPageCopyWith<$Res> {
  factory $PokemonPageCopyWith(
          PokemonPage value, $Res Function(PokemonPage) then) =
      _$PokemonPageCopyWithImpl<$Res>;
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<NamedApiResource>? results});
}

/// @nodoc
class _$PokemonPageCopyWithImpl<$Res> implements $PokemonPageCopyWith<$Res> {
  _$PokemonPageCopyWithImpl(this._value, this._then);

  final PokemonPage _value;
  // ignore: unused_field
  final $Res Function(PokemonPage) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<NamedApiResource>?,
    ));
  }
}

/// @nodoc
abstract class _$PokemonPageCopyWith<$Res>
    implements $PokemonPageCopyWith<$Res> {
  factory _$PokemonPageCopyWith(
          _PokemonPage value, $Res Function(_PokemonPage) then) =
      __$PokemonPageCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<NamedApiResource>? results});
}

/// @nodoc
class __$PokemonPageCopyWithImpl<$Res> extends _$PokemonPageCopyWithImpl<$Res>
    implements _$PokemonPageCopyWith<$Res> {
  __$PokemonPageCopyWithImpl(
      _PokemonPage _value, $Res Function(_PokemonPage) _then)
      : super(_value, (v) => _then(v as _PokemonPage));

  @override
  _PokemonPage get _value => super._value as _PokemonPage;

  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_PokemonPage(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<NamedApiResource>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_PokemonPage with DiagnosticableTreeMixin implements _PokemonPage {
  _$_PokemonPage({this.count, this.next, this.previous, this.results});

  factory _$_PokemonPage.fromJson(Map<String, dynamic> json) =>
      _$_$_PokemonPageFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final List<NamedApiResource>? results;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonPage(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonPage'))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('next', next))
      ..add(DiagnosticsProperty('previous', previous))
      ..add(DiagnosticsProperty('results', results));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokemonPage &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results);

  @JsonKey(ignore: true)
  @override
  _$PokemonPageCopyWith<_PokemonPage> get copyWith =>
      __$PokemonPageCopyWithImpl<_PokemonPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PokemonPageToJson(this);
  }
}

abstract class _PokemonPage implements PokemonPage {
  factory _PokemonPage(
      {int? count,
      String? next,
      String? previous,
      List<NamedApiResource>? results}) = _$_PokemonPage;

  factory _PokemonPage.fromJson(Map<String, dynamic> json) =
      _$_PokemonPage.fromJson;

  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  String? get next => throw _privateConstructorUsedError;
  @override
  String? get previous => throw _privateConstructorUsedError;
  @override
  List<NamedApiResource>? get results => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokemonPageCopyWith<_PokemonPage> get copyWith =>
      throw _privateConstructorUsedError;
}
