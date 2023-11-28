
/// Pokemon model
class Pokemon {
  final String? name;
  final String? path;

  const Pokemon({
    this.name,
    this.path,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json['name'] as String?,
        path: json['url'] as String?,
      );

  String get id {
    final split = path?.split('/');
    split?.removeLast();
    return split?.last ?? '1';
  }

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pokemon && other.name == name && other.path == path;

  @override
  int get hashCode => name.hashCode ^ path.hashCode;
}
