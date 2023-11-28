import 'package:flutter/foundation.dart';

import 'pokemon.dart';

///This is the model class for the pokemon list, it deserialize the json
///response from the api

class PokemonList {
  int? count;
  String? next;
  String? previous;
  List<Pokemon>? items;

  PokemonList({
    this.count,
    this.next,
    this.previous,
    this.items,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        count: json['count'] as int?,
        next: json['next'] as String?,
        previous: json['previous'] as String?,
        items: json['results'] != null
            ? (json['results'] as List)
                .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
                .toList()
            : null,
      );

  PokemonList copyWith({
    int? count,
    String? next,
    String? previous,
    List<Pokemon>? items,
  }) =>
      PokemonList(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        items: items ?? this.items,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonList &&
          other.runtimeType == runtimeType &&
          other.count == count &&
          other.next == next &&
          other.previous == previous &&
          listEquals(other.items, items);

  @override
  int get hashCode =>
      count.hashCode ^ next.hashCode ^ previous.hashCode ^ items.hashCode;
}

extension PokemonListExtension on PokemonList {
  PokemonList update(PokemonList other) {
    return PokemonList(
      count: other.count,
      next: other.next,
      previous: other.previous,
      items: [
        ...?items,
        ...?other.items,
      ],
    );
  }
}
