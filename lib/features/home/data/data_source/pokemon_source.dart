import 'package:pokedex/features/home/data/models/pokemon_details.dart';
import 'package:pokedex/features/home/data/models/pokemon_list.dart';
import 'package:pokedex/features/home/domain/params/pokemon_list_params.dart';

///[PokemonDataSource] is an abstract class that defines the methods that
///will be used to fetch data from the API
abstract class PokemonDataSource {
  ///get [PokemonList] from the API
  Future<PokemonList> getPokemonList({required PokemonListParams params});

  ///get [PokemonDetails] from the API
  Future<PokemonDetails> getPokemonDetails({required String pokemonName});
}
