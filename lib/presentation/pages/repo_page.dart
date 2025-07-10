import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/repo_view_model.dart';

class RepoPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RepoViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('GitHub Repo Viewer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'GitHub Username',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    viewModel.fetchRepos(_controller.text.trim());
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (viewModel.isLoading)
              CircularProgressIndicator()
            else if (viewModel.error != null)
              Text(viewModel.error!, style: TextStyle(color: Colors.red))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.repos.length,
                  itemBuilder: (context, index) {
                    final repo = viewModel.repos[index];
                    return Card(
                      child: ListTile(
                        title: Text(repo.name),
                        subtitle: Text(repo.description ?? 'No description'),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('⭐ ${repo.stars}'),
                            Text(repo.language ?? 'Unknown'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
