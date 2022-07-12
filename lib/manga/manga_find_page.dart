import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_manga/manga/manga_find_cubit.dart';
import 'package:mad_manga/manga/manga_list_cubit.dart';
import 'package:mad_manga/schemas/manga.dart';
import 'package:mad_manga/repository.dart';

class MangaFindPage extends StatelessWidget {
  const MangaFindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Manga Find')),
        body: BlocProvider(
            create: (_) => MangaFindCubit(
                  repository: context.read<Repository>(),
                )..fetchFind(),
            child: const MangaFindView()));
  }
}

class MangaFindView extends StatelessWidget {
  const MangaFindView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MangaFindCubit>().state;

    switch (state.status) {
      case FindStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case FindStatus.success:
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
              Manga item = items[index];
              Icon icon = item.selected
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : const Icon(Icons.check_circle_outline);
              return ItemTile(item: items[index], icon: icon);
            },
            itemCount: items.length,
          );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.item,
    required this.icon,
  }) : super(key: key);

  final Manga item;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: Text(item.name),
        trailing: icon,
        onTap: () {
          context.read<MangaFindCubit>().addItem(item);
        },
      ),
    );
  }
}
