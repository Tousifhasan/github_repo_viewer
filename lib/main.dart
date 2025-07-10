import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/repo_repository_impl.dart';
import 'domain/usecases/get_repos.dart';
import 'presentation/viewmodels/repo_view_model.dart';
import 'presentation/pages/repo_page.dart';

void main() {
  final repoRepository = RepoRepositoryImpl();
  final getReposUseCase = GetReposUseCase(repoRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RepoViewModel(getReposUseCase),
        ),
      ],
      child: MaterialApp(
        title: 'GitHub Repo Viewer',
        home: RepoPage(),
      ),
    ),
  );
}
