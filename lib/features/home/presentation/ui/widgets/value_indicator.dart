import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex/src/extensions/string.dart';

class ValueIndicator extends StatelessWidget {
  final String title;
  final double value;
  final Color indicatorColor;

  const ValueIndicator({
    super.key,
    required this.title,
    required this.value,
    required this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
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
            child: LinearPercentIndicator(
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
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
