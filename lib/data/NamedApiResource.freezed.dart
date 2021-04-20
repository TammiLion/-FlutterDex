// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'NamedApiResource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NamedApiResource _$NamedApiResourceFromJson(Map<String, dynamic> json) {
  return _NamedApiResource.fromJson(json);
}

/// @nodoc
class _$NamedApiResourceTearOff {
  const _$NamedApiResourceTearOff();

  _NamedApiResource call({String? name, String? url}) {
    return _NamedApiResource(
      name: name,
      url: url,
    );
  }

  NamedApiResource fromJson(Map<String, Object> json) {
    return NamedApiResource.fromJson(json);
  }
}

/// @nodoc
const $NamedApiResource = _$NamedApiResourceTearOff();

/// @nodoc
mixin _$NamedApiResource {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NamedApiResourceCopyWith<NamedApiResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NamedApiResourceCopyWith<$Res> {
  factory $NamedApiResourceCopyWith(
          NamedApiResource value, $Res Function(NamedApiResource) then) =
      _$NamedApiResourceCopyWithImpl<$Res>;
  $Res call({String? name, String? url});
}

/// @nodoc
class _$NamedApiResourceCopyWithImpl<$Res>
    implements $NamedApiResourceCopyWith<$Res> {
  _$NamedApiResourceCopyWithImpl(this._value, this._then);

  final NamedApiResource _value;
  // ignore: unused_field
  final $Res Function(NamedApiResource) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NamedApiResourceCopyWith<$Res>
    implements $NamedApiResourceCopyWith<$Res> {
  factory _$NamedApiResourceCopyWith(
          _NamedApiResource value, $Res Function(_NamedApiResource) then) =
      __$NamedApiResourceCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? url});
}

/// @nodoc
class __$NamedApiResourceCopyWithImpl<$Res>
    extends _$NamedApiResourceCopyWithImpl<$Res>
    implements _$NamedApiResourceCopyWith<$Res> {
  __$NamedApiResourceCopyWithImpl(
      _NamedApiResource _value, $Res Function(_NamedApiResource) _then)
      : super(_value, (v) => _then(v as _NamedApiResource));

  @override
  _NamedApiResource get _value => super._value as _NamedApiResource;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_NamedApiResource(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_NamedApiResource
    with DiagnosticableTreeMixin
    implements _NamedApiResource {
  _$_NamedApiResource({this.name, this.url});

  factory _$_NamedApiResource.fromJson(Map<String, dynamic> json) =>
      _$_$_NamedApiResourceFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NamedApiResource(name: $name, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NamedApiResource'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NamedApiResource &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(url);

  @JsonKey(ignore: true)
  @override
  _$NamedApiResourceCopyWith<_NamedApiResource> get copyWith =>
      __$NamedApiResourceCopyWithImpl<_NamedApiResource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NamedApiResourceToJson(this);
  }
}

abstract class _NamedApiResource implements NamedApiResource {
  factory _NamedApiResource({String? name, String? url}) = _$_NamedApiResource;

  factory _NamedApiResource.fromJson(Map<String, dynamic> json) =
      _$_NamedApiResource.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NamedApiResourceCopyWith<_NamedApiResource> get copyWith =>
      throw _privateConstructorUsedError;
}
