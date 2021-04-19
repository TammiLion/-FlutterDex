import 'package:dio/dio.dart';
import 'package:isekai_grinder/data/Pokemon.dart';
import 'package:retrofit/retrofit.dart';

part 'PokeApi.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2/")
abstract class PokeApi {
  factory PokeApi(Dio dio, {String baseUrl}) = _PokeApi;

  @GET("pokemon/{name}")
  Future<Pokemon> getPokemonByName(@Path("name") String name);

  @GET("pokemon/{id}")
  Future<Pokemon> getPokemon(@Path("id") int id);
}