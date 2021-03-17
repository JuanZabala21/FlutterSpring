import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:studyproject/src/pages/models/pelicula.dart';

class PeliculasProvider {

  String _apikey   = '1865f43a0549ca50d341dd9ab8b29f49';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-Es';

  Future<List<Pelicula>> getEncines() async {

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'  : _apikey,
      'language' : _language
    });

    final resp = http.get(url);
    final decodeData = json.decode(resp.body);

    print (decodeData);

  }

}