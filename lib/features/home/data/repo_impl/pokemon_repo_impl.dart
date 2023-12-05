import 'package:pokedex/app/helpers/api_interceptor.dart';
import 'package:pokedex/app/service_result/api_result.dart';
import 'package:pokedex/features/home/data/data_source/pokemon_source_impl.dart';
import 'package:pokedex/features/home/data/models/pokemon_details.dart';
import 'package:pokedex/features/home/data/models/pokemon_list.dart';
import 'package:pokedex/features/home/domain/params/pokemon_list_params.dart';
import 'package:pokedex/features/home/domain/repo/pokemon_repo.dart';

///[PokemonRepositoryImpl] is an implementation of [PokemonRepository] that
///uses [PokemonDataSourceImpl] to make the API calls
class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDataSourceImpl dataSource;

  PokemonRepositoryImpl(this.dataSource);

  @override
  Future<ApiResult<PokemonList>> getPokemonList({
    required PokemonListParams params,
  }) {
    return apiInterceptor(() => dataSource.getPokemonList(params: params));
  }

  @override
  Future<ApiResult<PokemonDetails>> getPokemonDetails({
    required String pokemonName,
  }) {
    return apiInterceptor(
      () => dataSource.getPokemonDetails(pokemonName: pokemonName),
    );
  }
}
