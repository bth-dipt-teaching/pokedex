import 'package:pokedex/app/service_result/api_result.dart';
import 'package:pokedex/features/home/data/models/pokemon_details.dart';
import 'package:pokedex/features/home/data/models/pokemon_list.dart';
import 'package:pokedex/features/home/domain/params/pokemon_list_params.dart';

///[PokemonRepository] is an abstract class that defines the methods that
///should be implemented by the [PokemonRepositoryImpl]
abstract class PokemonRepository {
  Future<ApiResult<PokemonList>> getPokemonList(
      {required PokemonListParams params});

  Future<ApiResult<PokemonDetails>> getPokemonDetails(
      {required String pokemonName});
}
