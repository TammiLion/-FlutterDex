// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'PokeApiPage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokeApiPage _$PokeApiPageFromJson(Map<String, dynamic> json) {
  return _PokeApiPage.fromJson(json);
}

/// @nodoc
class _$PokeApiPageTearOff {
  const _$PokeApiPageTearOff();

  _PokeApiPage call(
      {int? count,
      int? offset,
      String? next,
      String? previous,
      List<NamedApiResource>? results}) {
    return _PokeApiPage(
      count: count,
      offset: offset,
      next: next,
      previous: previous,
      results: results,
    );
  }

  PokeApiPage fromJson(Map<String, Object> json) {
    return PokeApiPage.fromJson(json);
  }
}

/// @nodoc
const $PokeApiPage = _$PokeApiPageTearOff();

/// @nodoc
mixin _$PokeApiPage {
  int? get count => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<NamedApiResource>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokeApiPageCopyWith<PokeApiPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiPageCopyWith<$Res> {
  factory $PokeApiPageCopyWith(
          PokeApiPage value, $Res Function(PokeApiPage) then) =
      _$PokeApiPageCopyWithImpl<$Res>;
  $Res call(
      {int? count,
      int? offset,
      String? next,
      String? previous,
      List<NamedApiResource>? results});
}

/// @nodoc
class _$PokeApiPageCopyWithImpl<$Res> implements $PokeApiPageCopyWith<$Res> {
  _$PokeApiPageCopyWithImpl(this._value, this._then);

  final PokeApiPage _value;
  // ignore: unused_field
  final $Res Function(PokeApiPage) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? offset = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
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
abstract class _$PokeApiPageCopyWith<$Res>
    implements $PokeApiPageCopyWith<$Res> {
  factory _$PokeApiPageCopyWith(
          _PokeApiPage value, $Res Function(_PokeApiPage) then) =
      __$PokeApiPageCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? count,
      int? offset,
      String? next,
      String? previous,
      List<NamedApiResource>? results});
}

/// @nodoc
class __$PokeApiPageCopyWithImpl<$Res> extends _$PokeApiPageCopyWithImpl<$Res>
    implements _$PokeApiPageCopyWith<$Res> {
  __$PokeApiPageCopyWithImpl(
      _PokeApiPage _value, $Res Function(_PokeApiPage) _then)
      : super(_value, (v) => _then(v as _PokeApiPage));

  @override
  _PokeApiPage get _value => super._value as _PokeApiPage;

  @override
  $Res call({
    Object? count = freezed,
    Object? offset = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_PokeApiPage(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
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
class _$_PokeApiPage with DiagnosticableTreeMixin implements _PokeApiPage {
  _$_PokeApiPage(
      {this.count, this.offset, this.next, this.previous, this.results});

  factory _$_PokeApiPage.fromJson(Map<String, dynamic> json) =>
      _$_$_PokeApiPageFromJson(json);

  @override
  final int? count;
  @override
  final int? offset;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final List<NamedApiResource>? results;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiPage(count: $count, offset: $offset, next: $next, previous: $previous, results: $results)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiPage'))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('next', next))
      ..add(DiagnosticsProperty('previous', previous))
      ..add(DiagnosticsProperty('results', results));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokeApiPage &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
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
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results);

  @JsonKey(ignore: true)
  @override
  _$PokeApiPageCopyWith<_PokeApiPage> get copyWith =>
      __$PokeApiPageCopyWithImpl<_PokeApiPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PokeApiPageToJson(this);
  }
}

abstract class _PokeApiPage implements PokeApiPage {
  factory _PokeApiPage(
      {int? count,
      int? offset,
      String? next,
      String? previous,
      List<NamedApiResource>? results}) = _$_PokeApiPage;

  factory _PokeApiPage.fromJson(Map<String, dynamic> json) =
      _$_PokeApiPage.fromJson;

  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  int? get offset => throw _privateConstructorUsedError;
  @override
  String? get next => throw _privateConstructorUsedError;
  @override
  String? get previous => throw _privateConstructorUsedError;
  @override
  List<NamedApiResource>? get results => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokeApiPageCopyWith<_PokeApiPage> get copyWith =>
      throw _privateConstructorUsedError;
}
