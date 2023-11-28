import 'package:pokedex/app/config/config.dart';
import 'package:pokedex/app/services/api/api_client.dart';
import 'package:pokedex/features/home/data/data_source/pokemon_source_impl.dart';
import 'package:pokedex/features/home/data/repo_impl/pokemon_repo_impl.dart';

/// Since this is an app to teach beginners how to use flutter,
/// we will not be using any external packages. We would only declare the values
/// here and assign values to them in main.dart

late final ApiConfig apiConfig;
late final ApiClient apiClient;


late final PokemonDataSourceImpl pokemonDataSource;
late final PokemonRepositoryImpl pokemonRepository;