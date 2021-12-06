// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
import 'package:projeto_estagio/model/typedetailed_model.dart';
import 'package:projeto_estagio/utils/consts_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';
import 'package:projeto_estagio/model/abilities_model.dart';

class PokeApi {
  Future<PokeUrl?> findAllUrl({String name = ''}) async {
    try {
      String url = Consts.baseUrl + name;
      final response = await FuncUtil.getUrl(url);
      return PokeUrl.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<Details?> searchPokemon({required String name}) async {
    try {
      final response = await FuncUtil.getUrl(Consts.baseUrl + name);
      return Details.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<Abilities?> searchAbility({required String url}) async {
    try {
      final response = await FuncUtil.getUrl(url);
      return Abilities.fromMap(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<TypeDetailed?> searchType({required String url}) async {
    try {
      final response = await FuncUtil.getUrl(url);
      return TypeDetailed.fromMap(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
