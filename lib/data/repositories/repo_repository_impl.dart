import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/repo.dart';
import '../../domain/repositories/repo_repository.dart';
import '../models/repo_model.dart';

class RepoRepositoryImpl implements RepoRepository {
  @override
  Future<List<Repo>> fetchRepos(String username) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/$username/repos'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) {
        final model = RepoModel.fromJson(json);
        return Repo(
          name: model.name,
          description: model.description,
          language: model.language,
          stars: model.stargazersCount,
        );
      }).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}
