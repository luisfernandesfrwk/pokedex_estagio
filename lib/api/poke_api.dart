// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';

class PokeApi {
  final String _baseUrl =
      'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1118';

  Future<PokeList?> findAllPokemons() async {
    try {
      final response = await Dio().get(_baseUrl);
      final Map<String, dynamic> decodedJson = jsonDecode(response.data);
      return PokeList.fromMap(decodedJson);
    } catch (e) {
      print('erro: $e');
      return null;
    }

    //final List<String> decodedJson = jsonDecode(response.data);
    //return decodedJson.map<PokeList>((e) => PokeList.fromJson(e)).toList();
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