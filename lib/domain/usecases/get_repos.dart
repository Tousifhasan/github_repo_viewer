import '../entities/repo.dart';
import '../repositories/repo_repository.dart';

class GetReposUseCase {
  final RepoRepository repository;

  GetReposUseCase(this.repository);

  Future<List<Repo>> call(String username) {
    return repository.fetchRepos(username);
  }
}
