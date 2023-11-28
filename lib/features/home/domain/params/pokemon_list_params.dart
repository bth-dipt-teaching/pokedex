
/// Parameters for the [PokemonList] use case.
class PokemonListParams {
  final int limit;
  final int offset;

  PokemonListParams({
    required this.limit,
    required this.offset,
  });
}