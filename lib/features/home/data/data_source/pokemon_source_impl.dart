import 'package:dio/dio.dart';
import 'package:pokedex/app/dependency_injection/dependency_injection.dart';
import 'package:pokedex/features/home/data/data_source/pokemon_source.dart';
import 'package:pokedex/features/home/data/models/pokemon_details.dart';
import 'package:pokedex/features/home/data/models/pokemon_list.dart';
import 'package:pokedex/features/home/domain/params/pokemon_list_params.dart';


///[PokemonDataSourceImpl] is an implementation of [PokemonDataSource] that
///uses [ApiClient] to make the API calls
class PokemonDataSourceImpl extends PokemonDataSource {
  @override
  Future<PokemonList> getPokemonList(
      {required PokemonListParams params}) async {
    Response response = await apiClient
        .get('/pokemon?limit=${params.limit}&offset=${params.offset}');

    return PokemonList.fromJson(response.data);
  }

  @override
  Future<PokemonDetails> getPokemonDetails(
      {required String pokemonName}) async {
    final response = await apiClient.get('/pokemon/$pokemonName');
    return PokemonDetails.fromJson(response.data);
  }
}
