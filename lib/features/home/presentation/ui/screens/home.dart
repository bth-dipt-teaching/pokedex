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
  // scroll controller to track the pokemon list
  ScrollController scrollController = ScrollController();
  PokemonList pokemonList = PokemonList(items: []);

  //to keep track of the initial loading state
  bool initialLoading = true;

  //to keep track of the error state
  bool hasError = false;

  //to know if there is more data to load
  bool hasMore = false;

  //to keep track of the offset to load more data
  int offset = 0;

  @override
  void initState() {
    super.initState();
    getPokemon(firstLoad: true);
  }

  //function to get the pokemon list, firstLoad is to know if it is the first
  //time, else it will load more data
  getPokemon({bool firstLoad = false}) async {
    //pokemon list params for the api call
    PokemonListParams params = PokemonListParams(limit: 20, offset: offset);
    //get the pokemon list from the repository
    final result = await pokemonRepository.getPokemonList(params: params);
    //check if the result is success or not
    PokemonList? newList = result.extractOrNull();
    //update the pokemonList
    setState(() {
      if (newList != null) {
        firstLoad
            ? pokemonList = newList
            : pokemonList = pokemonList.update(newList);
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
  void dispose() {
    super.dispose();
    //dispose the scroll controller to avoid memory leaks
    scrollController.dispose();
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
          : NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification &&
                    (scrollController.offset >=
                        (scrollController.position.maxScrollExtent - 10))) {
                  if (pokemonList.count! > pokemonList.items!.length) {
                    getPokemon();
                  } else {}
                }
                return true;
              },
              child: Scrollbar(
                thickness: 5,
                interactive: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: GridView.builder(
                    itemCount: pokemonList.items!.length,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.88,
                      crossAxisSpacing: 16,
                    ),
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

//added main branch
