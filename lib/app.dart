import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_manga/manga/manga_list_page.dart';
import 'package:mad_manga/repository.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.repository}) : super(key: key);

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repository,
      child: const MaterialApp(home: MangaListPage()),
    );
  }
}
