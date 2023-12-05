import 'package:flutter/material.dart';
import 'package:pokedex/features/home/data/models/pokemon_stats.dart';
import 'package:pokedex/features/home/presentation/ui/widgets/value_indicator.dart';

class PokemonBaseStatsIndicators extends StatelessWidget {
  final List<PokemonStats> baseStats;

  const PokemonBaseStatsIndicators({super.key, required this.baseStats});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.blue,
      Colors.blueGrey,
      Colors.green,
      Colors.purple,
      Colors.yellow,
      Colors.cyanAccent,
      Colors.brown,
    ];
    return Column(
      children: List.generate(baseStats.length, (index) => index)
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ValueIndicator(
                title: baseStats[e].stat!.name!.name,
                value: baseStats[e].baseStat! / 300,
                indicatorColor: colors[e],
              ),
            ),
          )
          .toList(),
    );
  }
}
