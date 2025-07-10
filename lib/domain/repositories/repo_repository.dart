import '../entities/repo.dart';

abstract class RepoRepository {
  Future<List<Repo>> fetchRepos(String username);
}
