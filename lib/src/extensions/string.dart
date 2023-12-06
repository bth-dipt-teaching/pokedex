extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) return this;

    // Split the string by spaces
    List<String> words = split(' ');

    // Capitalize the first letter of each word
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }

    // Join the words back together with spaces
    return words.join(' ');
  }

  String toHumanReadable() {
    // Convert camelCase to words
    String result = replaceAllMapped(
      RegExp(r'([a-z0-9])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );

    // Convert snake_case and kebab-case to words
    result = result.replaceAll(RegExp(r'[_-]'), ' ');

    // Capitalize the first letter
    result = result.trim().toLowerCase();
    result = result[0].toUpperCase() + result.substring(1);

    return result;
  }
}
