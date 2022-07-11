import 'package:isar/isar.dart';

part 'manga.g.dart';

@Collection()
class Manga {
  @Id()
  int? id;

  late String name;

  @Index(unique: true)
  late String uri;

  @Ignore()
  bool selected = false;
}
