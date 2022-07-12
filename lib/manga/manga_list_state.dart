part of 'manga_list_cubit.dart';

enum ListStatus { loading, success, failure }

class MangaListState extends Equatable {
  const MangaListState._({
    this.status = ListStatus.loading,
    this.items = const <Manga>[],
  });

  const MangaListState.loading() : this._();

  const MangaListState.success(List<Manga> items)
      : this._(status: ListStatus.success, items: items);

  const MangaListState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<Manga> items;

  @override
  List<Object> get props => [status, items];

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MangaListState && o.status == status && o.items == items;
  }

  @override
  int get hashCode => items.hashCode;
}
