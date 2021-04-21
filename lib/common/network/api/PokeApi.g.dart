// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PokeApi.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PokeApi implements PokeApi {
  _PokeApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://pokeapi.co/api/v2';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Pokemon> getPokemonByName(name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Pokemon>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/pokemon/$name',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Pokemon.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Pokemon> getPokemonById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Pokemon>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/pokemon/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Pokemon.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PokeApiPage> getPokemonPage(offset, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'offset': offset,
      r'limit': limit
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PokeApiPage>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/pokemon',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PokeApiPage.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
