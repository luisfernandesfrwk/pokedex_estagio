// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
import 'package:projeto_estagio/utils/consts_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';

class PokeApi {
  Future<PokeList?> findAllPokemons() async {
    try {
      final response =
          await FuncUtil.getUrl('${Consts.baseUrl}?offset=0&limit=180');

      return PokeList.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<Details?> findPokemon({required String index}) async {
    try {
      final response = await FuncUtil.getUrl(Consts.baseUrl + index);
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
