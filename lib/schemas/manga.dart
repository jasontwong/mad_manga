import 'package:isar/isar.dart';

part 'manga.g.dart';

@Collection()
class Manga {
  @Id()
  int? id;

  late String name;
}
