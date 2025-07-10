class RepoModel {
  final String name;
  final String? description;
  final String? language;
  final int stargazersCount;

  RepoModel({
    required this.name,
    this.description,
    this.language,
    required this.stargazersCount,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      name: json['name'],
      description: json['description'],
      language: json['language'],
      stargazersCount: json['stargazers_count'],
    );
  }
}
