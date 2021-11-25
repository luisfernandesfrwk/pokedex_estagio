// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_estagio/api/poke_api.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
part 'pokelist_store.g.dart';

class PokeListStore = _PokeListStoreBase with _$PokeListStore;

abstract class _PokeListStoreBase with Store {
  final PokeApi _pokeApi = PokeApi();

  @observable
  bool _endOfList = false;

  @observable
  int _offset = 0;

  @observable
  String search = "";

  @observable
  ObservableList<Details?> _listSearch = ObservableList<Details>();

  @observable
  ObservableList<Details?> _listPokemon = ObservableList<Details>();

  @observable
  Details? _pokemonDetail;

  @observable
  PokeList? _pokemonsUrl;

  @computed
  bool get end => _endOfList;

  @computed
  bool get isSearchValid => search.length > 3;

  @computed
  bool get isEmpty => search.isEmpty == true;

  @computed
  ObservableList<Details?> get listPokemon => _listPokemon;

  @computed
  ObservableList<Details?> get listSearch => _listSearch;

  @computed
  PokeList? get pokeUrl => _pokemonsUrl;

  @computed
  Details? get pokeDetail => _pokemonDetail;

  @action
  String setNewSearch(String value) => search = value;

  @action
  void clear(TextEditingController controller) {
    _listSearch.clear();
    search = '';
    controller.clear();
  }

  @action
  void onChangedText(String value) {
    search = value;
    if (search.length > 3) {
      _listSearch.clear();
      for (var pokemon in _listPokemon) {
        if (pokemon!.name!.contains(search)) {
          _listSearch.add(pokemon);
        }
      }
    }
  }

  @action
  Future fetchPokemonDetail({required String url}) => _pokeApi
          .findPokemon(url: url)
          .then((details) => _pokemonDetail = details)
          .onError((error, stackTrace) {
        print(error);
      });

  @action
  Future fetchPokemonUrl(int offset) =>
      _pokeApi.findAllPokemons(offset).then((pokemons) {
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
        });
      }).onError((error, stackTrace) {
        print('erro: $error');
      });

  @action
  Future setOffset() async {
    _offset++;

    if (_offset < 40) {
      await fetchPokemonUrl(_offset * 20);
    } else {
      return;
    }
  }
}
