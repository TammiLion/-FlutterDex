import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'Resource.freezed.dart';

@freezed
class Resource<T> with _$Resource<T> {
  const factory Resource(T data) = Data<T>;
  const factory Resource.loading() = Loading;
  const factory Resource.error([String? message]) = ErrorDetails;
}