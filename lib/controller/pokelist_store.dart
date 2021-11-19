// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:mobx/mobx.dart';
import 'package:projeto_estagio/api/poke_api.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
import 'package:projeto_estagio/utils/consts_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';
part 'pokelist_store.g.dart';

class PokeListStore = _PokeListStoreBase with _$PokeListStore;

abstract class _PokeListStoreBase with Store {
  final PokeApi _pokeApi = PokeApi();

  @observable
  List<Details?> _listPokemon = <Details>[];

  @observable
  Details? _pokemonDetail;

  @observable
  PokeList? _pokemonsUrl;

  @computed
  List<Details?> get listPokemon => _listPokemon;

  @computed
  PokeList? get pokeUrl => _pokemonsUrl;

  @computed
  Details? get pokeDetail => _pokemonDetail;

  @action
  Future fetchPokemonDetail({required String url}) => _pokeApi
          .findPokemon(url: url)
          .then((details) => _pokemonDetail = details)
          .onError((error, stackTrace) {
        print(error);
      });

  @action
  Future fetchPokemonUrl() => _pokeApi.findAllPokemons().then((pokemons) {
        _pokemonsUrl = pokemons;
        pokemons?.results.forEach((element) async {
          final response = await findPokemon(url: element.url);
          listPokemon.add(Details(
              abilities: response?.abilities,
              id: response?.id,
              moves: response?.moves,
              name: response?.name,
              order: response?.order,
              sprites: response?.sprites,
              stats: response?.stats,
              types: response!.types));
        });
      }).onError((error, stackTrace) {
        print('erro: $error');
      });

  Future<PokeList?> findAllPokemons() async {
    try {
      final response =
          await FuncUtil.getUrl('${Consts.baseUrl}?offset=0&limit=1118');

      // print(type);
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
