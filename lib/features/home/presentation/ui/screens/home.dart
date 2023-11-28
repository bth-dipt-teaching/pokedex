import 'package:flutter/material.dart';
import 'package:pokedex/app/dependency_injection/dependency_injection.dart';
import 'package:pokedex/app/service_result/api_result.dart';
import 'package:pokedex/features/home/data/models/pokemon_list.dart';
import 'package:pokedex/features/home/domain/params/pokemon_list_params.dart';
import 'package:pokedex/features/home/presentation/ui/widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //late final ScrollController scrollController;
  PokemonList pokemonList = PokemonList(items: []);

  bool initialLoading = true;
  bool hasError = false;
  int offset = 0;

  @override
  void initState() {
    super.initState();
    getPokemon(firstLoad: true);
  }

  getPokemon({bool firstLoad = false}) async {
    PokemonListParams params = PokemonListParams(limit: 20, offset: offset);
    final result = await pokemonRepository.getPokemonList(params: params);
    PokemonList? newList = result.extractOrNull();
    setState(() {
      if (newList != null) {
        firstLoad ? pokemonList = newList : pokemonList.update(newList);
        offset += 20;
      } else {
        if (mounted) {
          hasError = true;
        }
      }
      if (mounted && initialLoading) {
        initialLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: initialLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scrollbar(
              thickness: 5,
              interactive: true,
              child: NotificationListener(
                onNotification: (notification) {
                  return false;
                },
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: GridView.builder(
                    itemCount: pokemonList.items!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.88,
                            crossAxisSpacing: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PokemonCard(
                        pokemon: pokemonList.items![index],
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
