import 'package:dio/dio.dart';

class FuncUtil {
  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  static String findImage(String indexPokemon) =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$indexPokemon.png';
  static Future<Response<dynamic>> getUrl(String url) => Dio().get(url);
}
