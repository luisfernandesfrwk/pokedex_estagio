// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:mobx/mobx.dart';
import 'package:projeto_estagio/api/poke_api.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
part 'pokelist_store.g.dart';

class PokeListStore = _PokeListStoreBase with _$PokeListStore;

abstract class _PokeListStoreBase with Store {
  final PokeApi _pokeApi = PokeApi();

  @observable
  String search = '';

  @observable
  // ignore: prefer_final_fields
  ObservableList<Details?> _listPokemon = ObservableList<Details>();

  @observable
  Details? _pokemonDetail;

  @observable
  PokeList? _pokemonsUrl;

  @computed
  ObservableList<Details?> get listPokemon => _listPokemon;

  @computed
  PokeList? get pokeUrl => _pokemonsUrl;

  @computed
  Details? get pokeDetail => _pokemonDetail;

  @action
  String setSearch(String value) => search = value;

  @action
  void setList() {}

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
          final response = await _pokeApi.findPokemon(url: element.url);
          listPokemon.add(Details(
              abilities: response?.abilities,
              id: response?.id,
              moves: response?.moves,
              name: response?.name,
              order: response?.order,
              sprites: response?.sprites,
              stats: response?.stats,
              types: response!.types));
          listPokemon.sort((a, b) => a!.id!.toInt().compareTo(b!.id!.toInt()));
        });
      }).onError((error, stackTrace) {
        print('erro: $error');
      });
}
