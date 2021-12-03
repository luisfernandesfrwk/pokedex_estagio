// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_final_fields, unused_field, avoid_print

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
  PokeUrl? _pokemonsUrl;

  @computed
  ObservableList<Details?> get listPokemon => _listPokemon;

  @computed
  PokeUrl? get pokeUrl => _pokemonsUrl;

  @computed
  Details? get pokeDetail => _pokemonDetail;

  @computed
  bool get isSearching => _searching;

  @computed
  bool get isSearchValid => search.length > 3;

  @computed
  bool get isEmpty => search.isEmpty;

  @action
  void onChangedText(String value) => search = value;

  @action
  void onTapClear(TextEditingController controller) {
    search = '';
    _offset = 0;
    controller.clear();
    _listPokemon.clear();
    fetchPokemonUrl(_offset);
    setItemCount();
    _searching = false;
  }

  @action
  Future onTapSearch(SnackBar snackBar) async {
    if (isSearchValid) {
      _listPokemon.clear();
      _searching = true;
      final response = await fetchPokemonDetail(name: search.trim());

      listPokemon.add(response);
      setItemCount();
    } else {
      return snackBar;
    }
  }

  @action
  Future fetchPokemonDetail({required String name}) => _pokeApi
          .searchPokemon(name: name)
          .then((details) => _pokemonDetail = details)
          .onError((error, stackTrace) {
        print(error);
      });

  @action
  Future fetchPokemonUrl(int offset) =>
      _pokeApi.findAllUrl(name: '?offset=${offset}limit=20').then((pokemons) {
        _pokemonsUrl = pokemons;
        pokemons?.results.forEach((element) async {
          final response = await _pokeApi.findPokemon(url: element.url);
          listPokemon.add(response);
        });
      }).onError((error, stackTrace) {
        print('erro: $error');
      });

  @action
  Future setOffset() async {
    _offset++;

    if (_offset < 55) {
      await fetchPokemonUrl(_offset * 20);
    } else {
      return;
    }
  }

  @action
  int setItemCount() {
    if (!isSearching) {
      if (listPokemon.length < 1100) {
        itemCount = listPokemon.length + 1;
      } else {
        itemCount = listPokemon.length;
      }
    } else {
      itemCount = 1;
    }
    return itemCount;
  }

  @action
  bool canSetOffset(int index) {
    if (index == listPokemon.length && listPokemon.length < 1100) {
      setOffset();
      return true;
    }
    return false;
  }
}
