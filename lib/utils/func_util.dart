import 'package:dio/dio.dart';

class FuncUtil {
  static String capitalize(String? s) =>
      s == null ? '' : s[0].toUpperCase() + s.substring(1);
  static String findImage(String url) {
    var indexPokemon = url.split('/').elementAt(6);
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$indexPokemon.png';
  }

  static Future<Response<dynamic>> getUrl(String url) async =>
      await Dio().get(url);
}
