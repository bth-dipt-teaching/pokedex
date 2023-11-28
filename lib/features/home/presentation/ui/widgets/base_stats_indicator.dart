import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex/features/home/data/models/pokemon_stats.dart';
import 'package:pokedex/src/extensions/string.dart';

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
                  value: baseStats[e].baseStat!/300,
                  indicatorColor: colors[e],
                ),
              ),
            )
            .toList());
  }
}

class ValueIndicator extends StatelessWidget {
  final String title;
  final double value;
  final Color indicatorColor;

  const ValueIndicator(
      {super.key,
      required this.title,
      required this.value,
      required this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.toHumanReadable().capitalizeFirstLetter(),
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(width: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 260,
            ),
            child:  LinearPercentIndicator(
              percent: value,
              animation: true,
              lineHeight: 16,
              barRadius: const Radius.circular(16),
              progressColor: indicatorColor,
              center: Text(
                '${(value * 300).toInt()}/300',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              /*value: value,
              minHeight: 15,
              borderRadius: BorderRadius.circular(16),
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),*/
            ),
          ),
        ],
      ),
    );
  }
}
