import 'package:flutter/material.dart';
import '../../domain/entities/repo.dart';
import '../../domain/usecases/get_repos.dart';

class RepoViewModel extends ChangeNotifier {
  final GetReposUseCase getReposUseCase;

  RepoViewModel(this.getReposUseCase);

  List<Repo> _repos = [];
  String? _error;
  bool _isLoading = false;

  List<Repo> get repos => _repos;
  String? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> fetchRepos(String username) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _repos = await getReposUseCase(username);
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
