import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:mad_manga/manga/services/manga_here_service.dart';
import 'package:mad_manga/repository.dart';
import 'package:mad_manga/schemas/manga.dart';

part 'manga_find_state.dart';

class MangaFindCubit extends Cubit<MangaFindState> {
  MangaFindCubit({required this.repository})
      : super(const MangaFindState.loading());

  final Repository repository;

  Future<void> fetchFind() async {
    try {
      final db = await repository.isar;
      final List<Manga> items = await MangaHereService.browse();
      final List<Manga> mangas =
          await Future.wait(items.map((Manga item) async {
        Manga? manga = await db.mangas.where().uriEqualTo(item.uri).findFirst();
        item.selected = manga != null;
        return item;
      }).toList());

      print('fetchFind');

      emit(MangaFindState.success(mangas));
    } on Exception {
      emit(const MangaFindState.failure());
    }
  }

  Future<void> selectItem(Manga item) async {
    try {
      final selectSuccess = List.of(state.items).map((Manga manga) {
        if (manga.uri == item.uri) {
          manga.selected = true;
          print(true);
        }

        return manga;
      }).toList();

      emit(MangaFindState.success(selectSuccess));
    } on Exception {
      emit(const MangaFindState.failure());
    }
  }
}
