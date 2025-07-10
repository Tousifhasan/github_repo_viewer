class Repo {
  final String name;
  final String? description;
  final String? language;
  final int stars;

  Repo({
    required this.name,
    this.description,
    this.language,
    required this.stars,
  });
}
