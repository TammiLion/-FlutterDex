import 'package:dio/dio.dart';
import 'package:flutterdex/common/data/Pokemon.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutterdex/common/data/PokeApiPage.dart';

part 'PokeApi.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class PokeApi {
  factory PokeApi(Dio dio, {String baseUrl}) = _PokeApi;

  @GET("/pokemon/{name}")
  Future<Pokemon> getPokemonByName(@Path("name") String name);

  @GET("/pokemon/{id}")
  Future<Pokemon> getPokemonById(@Path("id") int id);

  @GET("/pokemon")
  Future<PokeApiPage> getPokemonPage(@Query("offset") int offset, @Query("limit") int limit);
}

