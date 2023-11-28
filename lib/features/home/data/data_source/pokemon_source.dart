import 'package:pokedex/features/home/data/models/pokemon_details.dart';
import 'package:pokedex/features/home/data/models/pokemon_list.dart';
import 'package:pokedex/features/home/domain/params/pokemon_list_params.dart';

abstract class PokemonDataSource {
  Future<PokemonList> getPokemonList({required PokemonListParams params});
  Future<PokemonDetails> getPokemonDetails({required String pokemonName});
}
