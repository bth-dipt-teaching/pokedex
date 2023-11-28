import 'package:flutter/foundation.dart';
import 'package:pokedex/features/home/data/models/pokemon_details.dart';

import 'pokemon_type.dart';


///[PokemonType] is a model class that defines the types from [PokemonDetails]

@immutable
class Types {
  const Types({
    this.type,
    this.slot,
  });

  factory Types.fromJson(Map<String, dynamic> json) => Types(
    slot: json['slot'] as int?,
    type: PokemonType.fromJson(json['type'] as Map<String, dynamic>),
  );
  final int? slot;
  final PokemonType? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Types &&
              other.runtimeType == runtimeType &&
              other.slot == slot &&
              other.type == type;

  @override
  int get hashCode => type.hashCode ^ slot.hashCode;
}
