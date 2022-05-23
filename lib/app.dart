import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_manga/manga/manga_list_page.dart';
import 'package:mad_manga/repository.dart';

class App extends MaterialApp {
  App({Key? key, required Repository repository})
      : super(
          key: key,
          home: RepositoryProvider.value(
            value: repository,
            child: const MangaListPage(),
          ),
        );
}
