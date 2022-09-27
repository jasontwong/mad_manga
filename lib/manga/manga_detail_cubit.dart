import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mad_manga/manga/services/manga_here_service.dart';
import 'package:mad_manga/repository.dart';
import 'package:mad_manga/schemas/manga.dart';
import 'package:mad_manga/schemas/manga_chapter.dart';

part 'manga_detail_state.dart';

class MangaDetailCubit extends Cubit<MangaDetailState> {
  MangaDetailCubit({required this.repository, required this.manga})
      : super(MangaDetailState.loading(manga));

  final Repository repository;
  final Manga manga;

  Future<void> fetchChapters() async {
    try {
      final List<MangaChapter> chapters =
          await MangaHereService.chapters(manga.uri);

      emit(MangaDetailState.success(manga, chapters));
    } on Exception {
      emit(MangaDetailState.failure(manga));
    }
  }
}
