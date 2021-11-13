import 'package:dio/dio.dart';

class PokeApi {
  void getHttp() async {
    try {
      var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/ditto');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
