import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdex/network/api/PokeApi.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio getDio() {
    final dio = Dio();
    dio.options.headers["Demo-Header"] = "demo header";
    if (kDebugMode) {
      dio.interceptors.add(
          LogInterceptor(request: true, requestBody: true, responseBody: true));
    }
    return dio;
  }

  @lazySingleton
  @dev
  @prod
  PokeApi getPokeApi(Dio dio) => PokeApi(dio);
}

@Injectable(as: PokeApi, env: [Environment.test])
class MockPokeApi extends Mock implements PokeApi {}
