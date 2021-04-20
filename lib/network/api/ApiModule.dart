
import 'package:dio/dio.dart';
import 'package:flutterdex/network/api/PokeApi.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

// @module
// abstract class ApiModule {
//
//   Dio getDio() {
//     final dio = Dio();
//     dio.options.headers["Demo-Header"] = "demo header";
//     dio.interceptors.add(LogInterceptor(responseBody: false));
//     return dio;
//   }
//
//   @Injectable(as: PokeApi, env: [Environment.prod, Environment.dev])
//   PokeApi getApi(Dio dio) {
//     return PokeApi(dio);
//   }
// }
//
// @Injectable(as: PokeApi, env: [Environment.test])
// class MockPokeApi extends Mock implements PokeApi {}
//
//