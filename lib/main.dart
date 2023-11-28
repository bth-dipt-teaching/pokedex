import 'package:flutter/material.dart';
import 'package:pokedex/app/config/api_config/api_config.dart';
import 'package:pokedex/app/dependency_injection/dependency_injection.dart';
import 'package:pokedex/features/home/data/data_source/pokemon_source_impl.dart';
import 'package:pokedex/features/home/data/repo_impl/pokemon_repo_impl.dart';
import 'package:pokedex/src/constants/constants.dart';

import 'app.dart';
import 'app/services/api/api_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  apiConfig = await Future.value(ApiConfig(baseUrl));
  apiClient = ApiClient(apiConfig);
  pokemonDataSource = await Future.value(PokemonDataSourceImpl());
  pokemonRepository = PokemonRepositoryImpl(pokemonDataSource);

  runApp(const PokedexApp());
}
