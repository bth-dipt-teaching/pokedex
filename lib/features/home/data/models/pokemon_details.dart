import 'package:flutter/foundation.dart';

import 'pokemon_stats.dart';
import 'types.dart';

///[PokemonDetails] is a model class that defines the properties of a pokemon
///details
@immutable
class PokemonDetails {
  const PokemonDetails({
    this.id,
    this.name,
    this.height,
    this.weight,
    this.baseExperience,
    this.types,
    this.stats,
  });

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => PokemonDetails(
        id: json['id'] as int?,
        name: json['name'] as String?,
        height: json['height'] as int?,
        weight: json['weight'] as int?,
        baseExperience: json['base_experience'] as int,
        stats: json['stats'] != null
            ? List<PokemonStats>.from(
                (json['stats'] as List<dynamic>).map(
                  (e) => PokemonStats.fromJson(e as Map<String, dynamic>),
                ),
              )
            : null,
        types: json['types'] != null
            ? (json['types'] as List)
                .map((e) => Types.fromJson(e as Map<String, dynamic>))
                .toList()
            : null,
      );

  final int? id;
  final String? name;
  final int? height;
  final int? weight;
  final int? baseExperience;
  final List<Types>? types;
  final List<PokemonStats>? stats;

  String get convertedHeight => (height! / 10).toStringAsFixed(1);

  String get convertedWeight => (weight! / 10).toStringAsFixed(1);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonDetails &&
          other.runtimeType == runtimeType &&
          other.id == id &&
          other.name == name &&
          other.height == height &&
          other.weight == weight &&
          other.baseExperience == baseExperience &&
          listEquals(other.types, types) &&
          listEquals(other.stats, stats);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      baseExperience.hashCode ^
      types.hashCode ^
      stats.hashCode;
}
