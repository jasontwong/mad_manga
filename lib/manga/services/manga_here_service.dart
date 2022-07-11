import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

import 'package:mad_manga/schemas/manga.dart';

class MangaHereService {
  static const _url = 'http://www.mangahere.cc';

  static Future browse() async {
    List<Manga> _mangas = [];
    var response = await Client().get(Uri.parse(_url + "/directory"));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      List<Element> mangaList =
          document.querySelectorAll(".manga-list-1-list > li > a");

      for (var manga in mangaList) {
        var title = manga.attributes['title'] ?? '';
        var href = manga.attributes['href'] ?? '';

        if (title != '' && href != '') {
          Manga _manga = Manga();
          _manga.name = title;
          _manga.uri = _url + href;
          _mangas.add(_manga);
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return _mangas;
  }
}
