// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';

class PokeApi {
  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<PokeList?> findAllPokemons() async {
    try {
      final response = await getUrl('$_baseUrl?offset=0&limit=1118');

      return PokeList.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<Details?> findPokemon({required String index}) async {
    try {
      final response = await getUrl(_baseUrl + index);
      return Details.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<Response<dynamic>> getUrl(String url) => Dio().get(url);
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
