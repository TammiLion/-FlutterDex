// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'HomeEvent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeEventTearOff {
  const _$HomeEventTearOff();

  PokemonClicked call(int position) {
    return PokemonClicked(
      position,
    );
  }

  StartOfPage startOfPage() {
    return const StartOfPage();
  }

  EndOfPage endOfPage() {
    return const EndOfPage();
  }
}

/// @nodoc
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int position) $default, {
    required TResult Function() startOfPage,
    required TResult Function() endOfPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int position)? $default, {
    TResult Function()? startOfPage,
    TResult Function()? endOfPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PokemonClicked value) $default, {
    required TResult Function(StartOfPage value) startOfPage,
    required TResult Function(EndOfPage value) endOfPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PokemonClicked value)? $default, {
    TResult Function(StartOfPage value)? startOfPage,
    TResult Function(EndOfPage value)? endOfPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class $PokemonClickedCopyWith<$Res> {
  factory $PokemonClickedCopyWith(
          PokemonClicked value, $Res Function(PokemonClicked) then) =
      _$PokemonClickedCopyWithImpl<$Res>;
  $Res call({int position});
}

/// @nodoc
class _$PokemonClickedCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $PokemonClickedCopyWith<$Res> {
  _$PokemonClickedCopyWithImpl(
      PokemonClicked _value, $Res Function(PokemonClicked) _then)
      : super(_value, (v) => _then(v as PokemonClicked));

  @override
  PokemonClicked get _value => super._value as PokemonClicked;

  @override
  $Res call({
    Object? position = freezed,
  }) {
    return _then(PokemonClicked(
      position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$PokemonClicked with DiagnosticableTreeMixin implements PokemonClicked {
  const _$PokemonClicked(this.position);

  @override
  final int position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent(position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeEvent'))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PokemonClicked &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(position);

  @JsonKey(ignore: true)
  @override
  $PokemonClickedCopyWith<PokemonClicked> get copyWith =>
      _$PokemonClickedCopyWithImpl<PokemonClicked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int position) $default, {
    required TResult Function() startOfPage,
    required TResult Function() endOfPage,
  }) {
    return $default(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int position)? $default, {
    TResult Function()? startOfPage,
    TResult Function()? endOfPage,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PokemonClicked value) $default, {
    required TResult Function(StartOfPage value) startOfPage,
    required TResult Function(EndOfPage value) endOfPage,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PokemonClicked value)? $default, {
    TResult Function(StartOfPage value)? startOfPage,
    TResult Function(EndOfPage value)? endOfPage,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class PokemonClicked implements HomeEvent {
  const factory PokemonClicked(int position) = _$PokemonClicked;

  int get position => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonClickedCopyWith<PokemonClicked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartOfPageCopyWith<$Res> {
  factory $StartOfPageCopyWith(
          StartOfPage value, $Res Function(StartOfPage) then) =
      _$StartOfPageCopyWithImpl<$Res>;
}

/// @nodoc
class _$StartOfPageCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $StartOfPageCopyWith<$Res> {
  _$StartOfPageCopyWithImpl(
      StartOfPage _value, $Res Function(StartOfPage) _then)
      : super(_value, (v) => _then(v as StartOfPage));

  @override
  StartOfPage get _value => super._value as StartOfPage;
}

/// @nodoc
class _$StartOfPage with DiagnosticableTreeMixin implements StartOfPage {
  const _$StartOfPage();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.startOfPage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'HomeEvent.startOfPage'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is StartOfPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int position) $default, {
    required TResult Function() startOfPage,
    required TResult Function() endOfPage,
  }) {
    return startOfPage();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int position)? $default, {
    TResult Function()? startOfPage,
    TResult Function()? endOfPage,
    required TResult orElse(),
  }) {
    if (startOfPage != null) {
      return startOfPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PokemonClicked value) $default, {
    required TResult Function(StartOfPage value) startOfPage,
    required TResult Function(EndOfPage value) endOfPage,
  }) {
    return startOfPage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PokemonClicked value)? $default, {
    TResult Function(StartOfPage value)? startOfPage,
    TResult Function(EndOfPage value)? endOfPage,
    required TResult orElse(),
  }) {
    if (startOfPage != null) {
      return startOfPage(this);
    }
    return orElse();
  }
}

abstract class StartOfPage implements HomeEvent {
  const factory StartOfPage() = _$StartOfPage;
}

/// @nodoc
abstract class $EndOfPageCopyWith<$Res> {
  factory $EndOfPageCopyWith(EndOfPage value, $Res Function(EndOfPage) then) =
      _$EndOfPageCopyWithImpl<$Res>;
}

/// @nodoc
class _$EndOfPageCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $EndOfPageCopyWith<$Res> {
  _$EndOfPageCopyWithImpl(EndOfPage _value, $Res Function(EndOfPage) _then)
      : super(_value, (v) => _then(v as EndOfPage));

  @override
  EndOfPage get _value => super._value as EndOfPage;
}

/// @nodoc
class _$EndOfPage with DiagnosticableTreeMixin implements EndOfPage {
  const _$EndOfPage();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.endOfPage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'HomeEvent.endOfPage'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EndOfPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int position) $default, {
    required TResult Function() startOfPage,
    required TResult Function() endOfPage,
  }) {
    return endOfPage();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int position)? $default, {
    TResult Function()? startOfPage,
    TResult Function()? endOfPage,
    required TResult orElse(),
  }) {
    if (endOfPage != null) {
      return endOfPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PokemonClicked value) $default, {
    required TResult Function(StartOfPage value) startOfPage,
    required TResult Function(EndOfPage value) endOfPage,
  }) {
    return endOfPage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PokemonClicked value)? $default, {
    TResult Function(StartOfPage value)? startOfPage,
    TResult Function(EndOfPage value)? endOfPage,
    required TResult orElse(),
  }) {
    if (endOfPage != null) {
      return endOfPage(this);
    }
    return orElse();
  }
}

abstract class EndOfPage implements HomeEvent {
  const factory EndOfPage() = _$EndOfPage;
}
