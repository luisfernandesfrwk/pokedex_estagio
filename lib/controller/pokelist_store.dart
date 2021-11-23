// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_final_fields, unused_field

import 'package:mobx/mobx.dart';
import 'package:projeto_estagio/api/poke_api.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
part 'pokelist_store.g.dart';

class PokeListStore = _PokeListStoreBase with _$PokeListStore;

abstract class _PokeListStoreBase with Store {
  final PokeApi _pokeApi = PokeApi();

  @observable
  String _search = "";

  @observable
  ObservableList<Details?> _listSearch = ObservableList<Details>();

  @observable
  ObservableList<Details?> _listPokemon = ObservableList<Details>();

  @observable
  Details? _pokemonDetail;

  @observable
  PokeList? _pokemonsUrl;

  @computed
  bool get getSearch => _search.isEmpty;

  @computed
  ObservableList<Details?> get listPokemon => _listPokemon;

  @computed
  ObservableList<Details?> get listSearch => _listSearch;

  @computed
  PokeList? get pokeUrl => _pokemonsUrl;

  @computed
  Details? get pokeDetail => _pokemonDetail;

  @action
  String setNewSearch(String value) => _search = value;

  @action
  void setListSearch() {
    if (_search.length > 3) {
      for (var pokemon in _listPokemon) {
        if (pokemon!.name!.contains(_search)) {
          _listSearch.add(pokemon);
        }
      }
    } else {
      _listSearch.clear();
      setHomeList();
    }
  }

  @action
  void setHomeList() {
    _listSearch = ObservableList<Details?>()..addAll(_listPokemon);
  }

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
          //listPokemon.sort((a, b) => a!.id!.toInt().compareTo(b!.id!.toInt()));
          _listSearch = ObservableList<Details?>()..addAll(listPokemon);
        });
      }).onError((error, stackTrace) {
        print('erro: $error');
      });
}
