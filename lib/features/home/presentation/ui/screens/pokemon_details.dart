import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/app/dependency_injection/dependency_injection.dart';
import 'package:pokedex/app/service_result/api_result.dart';
import 'package:pokedex/features/home/data/models/pokemon.dart';
import 'package:pokedex/features/home/data/models/pokemon_details.dart';
import 'package:pokedex/features/home/presentation/ui/widgets/base_stats_indicator.dart';
import 'package:pokedex/features/home/presentation/ui/widgets/metric_details.dart';
import 'package:pokedex/src/extensions/string.dart';

class PokemonDetailsScreen extends StatefulWidget {
  final Pokemon pokemon;
  final PaletteGenerator paletteGenerator;

  const PokemonDetailsScreen(
      {super.key, required this.pokemon, required this.paletteGenerator});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<PokemonDetails?> loadPokemonDetails() async {
    final result = await pokemonRepository.getPokemonDetails(
        pokemonName: widget.pokemon.name!);
    PokemonDetails? details = result.extractOrNull();

    return details;
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    List paletteColors = widget.paletteGenerator.paletteColors.toList();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBar: AppBar(
        centerTitle: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(48),
                bottomLeft: Radius.circular(48))),
        elevation: 0,
        backgroundColor: widget.paletteGenerator.dominantColor?.color ??
            const Color(0xFFB8DFCA),
        title: const Text('Pokedex'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              '#${widget.pokemon.id}',
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size(double.maxFinite, 200),
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: Hero(
                    tag: 'pokemon-${widget.pokemon.name}',
                    child: CachedNetworkImage(
                        imageUrl: widget.pokemon.imageUrl)))),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            widget.pokemon.name?.capitalizeFirstLetter() ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 26, color: Colors.white),
          ),
          FutureBuilder<PokemonDetails?>(
              future: loadPokemonDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;

                    return Column(
                      children: [
                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          spacing: 20,
                          children: data.types
                                  ?.map(
                                    (e) => Chip(
                                      backgroundColor: widget
                                          .paletteGenerator
                                          .paletteColors[random.nextInt(
                                              paletteColors.length - 1)]
                                          .color,
                                      label: Text(
                                        e.type!.name!.capitalizeFirstLetter(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                  .toList() ??
                              [],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MetricDetails(
                                title: 'Weight',
                                value: '${data.convertedWeight} KG'),
                            MetricDetails(
                              title: 'Height',
                              value: '${data.convertedHeight} M',
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        PokemonBaseStatsIndicators(
                          baseStats: data.stats ?? [],
                        ),
                      ],
                    );
                  }
                }

                return const SizedBox(
                    height: 300,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ));
              })
        ],
      ),
    );
  }
}
