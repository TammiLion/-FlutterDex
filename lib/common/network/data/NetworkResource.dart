import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'NetworkResource.freezed.dart';

@freezed
class NetworkResource<T> with _$NetworkResource<T> {
  const factory NetworkResource(T data) = Data<T>;
  const factory NetworkResource.loading() = Loading;
  const factory NetworkResource.error([String? message]) = ErrorDetails;
}