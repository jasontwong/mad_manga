import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_manga/manga/manga_detail_cubit.dart';
import 'package:mad_manga/schemas/manga.dart';
import 'package:mad_manga/repository.dart';
import 'package:mad_manga/schemas/manga_chapter.dart';

class MangaDetailPage extends StatelessWidget {
  const MangaDetailPage({Key? key, required this.item}) : super(key: key);

  final Manga item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Manga Detail')),
        body: BlocProvider(
            create: (_) => MangaDetailCubit(
                  repository: context.read<Repository>(),
                  manga: item,
                )..fetchChapters(),
            child: const MangaDetailView()));
  }
}

class MangaDetailView extends StatelessWidget {
  const MangaDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MangaDetailCubit>().state;

    switch (state.status) {
      case DetailStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case DetailStatus.success:
        return ItemView(items: state.chapters);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class ItemView extends StatelessWidget {
  const ItemView({Key? key, required this.items}) : super(key: key);

  final List<MangaChapter> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const Center(child: Text('no content'))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ItemTile(item: items[index]);
            },
            itemCount: items.length,
          );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MangaChapter item;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: Text(item.name),
        onTap: () {
          // context.read<MangaDetailCubit>().addItem(item);
        },
      ),
    );
  }
}
