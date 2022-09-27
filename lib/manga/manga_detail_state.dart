part of 'manga_detail_cubit.dart';

enum DetailStatus { loading, success, failure }

class MangaDetailState extends Equatable {
  const MangaDetailState._({
    this.status = DetailStatus.loading,
    this.chapters = const <MangaChapter>[],
    required this.item,
  });

  const MangaDetailState.loading(Manga item) : this._(item: item);

  const MangaDetailState.success(Manga item, List<MangaChapter> chapters)
      : this._(status: DetailStatus.success, item: item, chapters: chapters);

  const MangaDetailState.failure(Manga item)
      : this._(status: DetailStatus.failure, item: item);

  final DetailStatus status;
  final Manga item;
  final List<MangaChapter> chapters;

  @override
  List<Object> get props => [status, item, chapters];

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MangaDetailState && o.status == status && o.item == item;
  }

  @override
  int get hashCode => item.hashCode;
}
