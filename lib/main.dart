import 'package:flutter/material.dart';
import 'package:pokedex/app/config/api_config/api_config.dart';
import 'package:pokedex/app/dependency_injection/dependency_injection.dart';
import 'package:pokedex/features/home/data/data_source/pokemon_source_impl.dart';
import 'package:pokedex/features/home/data/repo_impl/pokemon_repo_impl.dart';
import 'package:pokedex/src/constants/constants.dart';

import 'app.dart';
import 'app/services/api/api_client.dart';

///This is the starting point of the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize api client and api config
  apiConfig = await Future.value(ApiConfig(baseUrl));
  apiClient = ApiClient(apiConfig);
  //initialize data source and repository
  pokemonDataSource = await Future.value(PokemonDataSourceImpl());
  pokemonRepository = PokemonRepositoryImpl(pokemonDataSource);
  // run the app
  runApp(const PokedexApp());
}
