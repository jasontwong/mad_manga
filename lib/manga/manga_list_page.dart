import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_manga/manga/manga_list_cubit.dart';
import 'package:mad_manga/repository.dart';
import 'package:mad_manga/schemas/manga.dart';
import 'package:mad_manga/manga/manga_find_page.dart';

class MangaListPage extends StatelessWidget {
  const MangaListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MangaListCubit(
              repository: context.read<Repository>(),
            )..fetchList(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Manga List')),
          body: const MangaListView(),
          floatingActionButton: const MangaAddButton(),
        ));
  }
}

class MangaAddButton extends StatelessWidget {
  const MangaAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_context) => BlocProvider.value(
                  value: BlocProvider.of<MangaListCubit>(context),
                  child: const MangaFindPage())));
        });
  }
}

class MangaListView extends StatelessWidget {
  const MangaListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MangaListCubit>().state;

    switch (state.status) {
      case ListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case ListStatus.success:
        return ItemView(items: state.items);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class ItemView extends StatelessWidget {
  const ItemView({Key? key, required this.items}) : super(key: key);

  final List<Manga> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const Center(child: Text('no content'))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ItemTile(
                item: items[index],
              );
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

  final Manga item;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: Text(item.name),
      ),
    );
  }
}
