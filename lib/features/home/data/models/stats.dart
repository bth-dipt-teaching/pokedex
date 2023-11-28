import 'package:flutter/foundation.dart';

@immutable
class Stat {
  const Stat({
    this.name,
    this.url,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        name: PokemonStat.mapValueToStat(json['name'] as String),
        url: json['url'] as String,
      );

  final PokemonStat? name;
  final String? url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stat &&
          other.runtimeType == runtimeType &&
          other.name == name &&
          other.url == url;

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

enum PokemonStat {
  hp('hp'),
  attack('atk'),
  defense('def'),
  specialAttack('sa'),
  specialDefense('sd'),
  speed('spd'),
  unknown('');

  const PokemonStat(this.initial);

  final String initial;

  String get name {
    return toString().split('.').last;
  }

  static PokemonStat mapValueToStat(String value) {
    if (value == 'hp') {
      return PokemonStat.hp;
    } else if (value == 'attack') {
      return PokemonStat.attack;
    } else if (value == 'defense') {
      return PokemonStat.defense;
    } else if (value == 'special-attack') {
      return PokemonStat.specialAttack;
    } else if (value == 'special-defense') {
      return PokemonStat.specialDefense;
    } else if (value == 'speed') {
      return PokemonStat.speed;
    } else {
      return PokemonStat.unknown;
    }
  }
}
