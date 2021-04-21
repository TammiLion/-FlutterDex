// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'HomeState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {ListViewData? list, InfoViewData? loading, InfoViewData? error}) {
    return _HomeState(
      list: list,
      loading: loading,
      error: error,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  ListViewData? get list => throw _privateConstructorUsedError;
  InfoViewData? get loading => throw _privateConstructorUsedError;
  InfoViewData? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call({ListViewData? list, InfoViewData? loading, InfoViewData? error});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? loading = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListViewData?,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as InfoViewData?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as InfoViewData?,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call({ListViewData? list, InfoViewData? loading, InfoViewData? error});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? list = freezed,
    Object? loading = freezed,
    Object? error = freezed,
  }) {
    return _then(_HomeState(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListViewData?,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as InfoViewData?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as InfoViewData?,
    ));
  }
}

/// @nodoc
class _$_HomeState with DiagnosticableTreeMixin implements _HomeState {
  _$_HomeState({this.list, this.loading, this.error});

  @override
  final ListViewData? list;
  @override
  final InfoViewData? loading;
  @override
  final InfoViewData? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState(list: $list, loading: $loading, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState'))
      ..add(DiagnosticsProperty('list', list))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.list, list) ||
                const DeepCollectionEquality().equals(other.list, list)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(list) ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {ListViewData? list,
      InfoViewData? loading,
      InfoViewData? error}) = _$_HomeState;

  @override
  ListViewData? get list => throw _privateConstructorUsedError;
  @override
  InfoViewData? get loading => throw _privateConstructorUsedError;
  @override
  InfoViewData? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
