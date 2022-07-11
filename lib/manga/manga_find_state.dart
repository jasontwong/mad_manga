part of 'manga_find_cubit.dart';

enum FindStatus { loading, success, failure }

class MangaFindState extends Equatable {
  const MangaFindState._({
    this.status = FindStatus.loading,
    this.items = const <Manga>[],
  });

  const MangaFindState.loading() : this._();

  const MangaFindState.success(List<Manga> items)
      : this._(status: FindStatus.success, items: items);

  const MangaFindState.failure() : this._(status: FindStatus.failure);

  final FindStatus status;
  final List<Manga> items;

  @override
  List<Object> get props => [status, items];

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MangaFindState && o.status == status && o.items == items;
  }

  @override
  int get hashCode => items.hashCode;
}
