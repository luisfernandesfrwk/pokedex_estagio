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
  bool _searching = false;

  @observable
  int itemCount = 20;

  @observable
  int _offset = 0;

  @observable
  String search = "";

  @observable
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

  @computed
  bool get isSearching => _searching;

  @computed
  bool get isSearchValid => search.length > 3;

  @computed
  bool get isEmpty => search.isEmpty;

  @action
  String setNewSearch(String value) => search = value;

  @action
  void onChangedText(String value) => search = value;

  @action
  void onTapClear(TextEditingController controller) {
    search = '';
    controller.clear();
    _searching = false;
  }

  @action
  Future onTapSearch(SnackBar snackBar) async {
    // print(search);
    if (isSearchValid) {
      _searching = true;
      await _pokeApi
          .searchPokemon(name: search)
          .then((value) => _pokemonDetail = value)
          .onError((error, stackTrace) {
        print(error);
      });
    } else {
      return snackBar;
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

  @action
  int setItemCount() {
    if (!isSearching) {
      if (listPokemon.length < 800) {
        itemCount = listPokemon.length + 1;
      } else {
        itemCount = listPokemon.length;
      }
    } else {
      itemCount = 0;
    }
    return itemCount;
  }

  @action
  Details? setDetail(int index) {
    if (!isSearching) {
      return listPokemon[index];
    } else {
      return pokeDetail;
    }
  }
}
