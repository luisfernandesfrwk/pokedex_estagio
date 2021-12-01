// ignore_for_file: avoid_print

import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
import 'package:projeto_estagio/utils/consts_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';

class PokeApi {
  Future<PokeUrl?> findAllUrl({String name = ''}) async {
    try {
      String url = Consts.baseUrl + name;
      final response = await FuncUtil.getPokemon(url);
      return PokeUrl.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<Details?> findPokemon({required String url}) async {
    try {
      final response = await FuncUtil.getPokemon(url);
      return Details.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<Details?> searchPokemon({required String name}) async {
    try {
      final response = await FuncUtil.getPokemon(Consts.baseUrl + name);

      print(response.statusCode);
      return Details.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }
}
