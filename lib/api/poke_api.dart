// ignore_for_file: avoid_print

import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
import 'package:projeto_estagio/utils/consts_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';

class PokeApi {
  Future<PokeList?> findAllPokemons() async {
    try {
      final response =
          await FuncUtil.getUrl('${Consts.baseUrl}?offset=0&limit=50');

      return PokeList.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<Details?> findPokemon({required String url}) async {
    try {
      final response = await FuncUtil.getUrl(url);
      return Details.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }
}

// exemplo
 // void getHttp() async {
  //   try {
  //     var response = await Dio().get(_baseUrl);
  //     print(response.data);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
