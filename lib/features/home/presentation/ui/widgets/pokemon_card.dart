import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/features/home/data/models/pokemon.dart';
import 'package:pokedex/features/home/presentation/ui/screens/pokemon_details.dart';
import 'package:pokedex/src/extensions/string.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    Future<PaletteGenerator> generateBg() async {
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(
          pokemon.imageUrl,
        ),
      );
      return paletteGenerator;
    }

    return FutureBuilder(
      future: generateBg(),
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PokemonDetailsScreen(
                    pokemon: pokemon,
                    paletteGenerator: snapshot.data!,
                  );
                },
              ),
            );
          },
          child: Container(
            height: 350,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
              color: snapshot.data?.dominantColor?.color ??
                  Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'pokemon-${pokemon.name}',
                  child: CachedNetworkImage(
                    imageUrl: pokemon.imageUrl,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  pokemon.name?.capitalizeFirstLetter() ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
