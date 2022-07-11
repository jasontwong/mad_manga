import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:mad_manga/repository.dart';
import 'package:mad_manga/schemas/manga.dart';

part 'manga_list_state.dart';

class MangaListCubit extends Cubit<MangaListState> {
  MangaListCubit({required this.repository})
      : super(const MangaListState.loading());

  final Repository repository;

  Future<void> fetchList() async {
    try {
      final db = await repository.isar;
      final items = await db.mangas.where().findAll();

      emit(MangaListState.success(items));
    } on Exception {
      emit(const MangaListState.failure());
    }
  }

  Future<void> addItem(Manga item) async {
    try {
      final db = await repository.isar;
      await db.writeTxn((isar) async {
        item.id = await db.mangas.put(item);
      });

      final addSuccess = List.of(state.items)..add(item);

      emit(MangaListState.success(addSuccess));
    } on Exception {
      emit(const MangaListState.failure());
    }
  }
}
