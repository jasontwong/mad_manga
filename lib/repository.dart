import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mad_manga/schemas/manga.dart';

class Repository {
  late Future<Isar> isar;

  Repository() {
    isar = _setup();
  }

  Future<Isar> _setup() async {
    final dir = await getApplicationSupportDirectory();

    return await Isar.open(
      schemas: [MangaSchema],
      directory: dir.path,
    );
  }
}
