import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_estagio/api/poke_api.dart';
import 'package:pokedex_estagio/model/abilities_model.dart';
import 'package:pokedex_estagio/model/details_model.dart';
import 'package:pokedex_estagio/model/pokelist_model.dart';
import 'package:pokedex_estagio/model/typedetailed_model.dart';
part 'pokedex_store.g.dart';

class PokedexStore = _PokedexStoreBase with _$PokedexStore;

abstract class _PokedexStoreBase with Store {
  final PokeApi _pokeApi = PokeApi();

  @observable
  bool _visible = true;

  @observable
  bool _searching = false;

  @observable
  int itemCount = 20;

  @observable
  int _offset = 0;

  @observable
  String search = "";

  @observable
  ObservableList<TypeDetailed?> _listType = ObservableList<TypeDetailed?>();

  @observable
  ObservableList<Abilities?> _listAbility = ObservableList<Abilities?>();

  @observable
  ObservableList<Details?> _listPokemon = ObservableList<Details>();

  @observable
  Details? _pokemonDetail;

  @observable
  PokeUrl? _pokemonsUrl;

  @computed
  ObservableList<TypeDetailed?> get listType => _listType;

  @computed
  ObservableList<Abilities?> get listAbility => _listAbility;

  @computed
  ObservableList<Details?> get listPokemon => _listPokemon;

  @computed
  PokeUrl? get pokeUrl => _pokemonsUrl;

  @computed
  Details? get pokeDetail => _pokemonDetail;

  @computed
  int get getOfsset => _offset;

  @computed
  bool get isVibile => _visible;

  @computed
  bool get isSearching => _searching;

  @computed
  bool get isSearchValid => search.length > 3;

  @computed
  bool get isEmpty => search.isEmpty;

  @action
  void onChangedText(String value) {
    search = value;
    if (value.isEmpty && isSearching) _returnToHome();
  }

  @action
  void onTapClear(TextEditingController controller) {
    search = '';
    controller.clear();
    if (isSearching) _returnToHome();
  }

  void _returnToHome() {
    _offset = 0;
    _listPokemon.clear();
    fetchPokemonUrl(_offset);
    setItemCount();
    _searching = false;
  }

  @action
  Future onTapSearch(SnackBar snackBar) async {
    if (isSearchValid) {
      _visible = false;
      _listPokemon.clear();
      _searching = true;
      final response = await fetchPokemonDetail(name: search.trim());
      if (response != null) {
        listPokemon.add(response);
        setItemCount();
      }
      _visible = true;
    } else {
      return snackBar;
    }
  }

  @action
  Future fetchPokemonType({required String url}) =>
      _pokeApi.searchType(url: url).then((type) => _listType.add(type));

  @action
  Future fetchPokemonAbility({required String url}) => _pokeApi
      .searchAbility(url: url)
      .then((ability) => _listAbility.add(ability))
      .onError((error, stackTrace) => print(error));

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
          final response = await _pokeApi.searchPokemon(name: element.name);
          if (response != null) {
            listPokemon.add(response);
          }
        });
      }).onError((error, stackTrace) {
        print('erro: $error');
      });

  @action
  Future setOffset() async {
    if (_offset <= 55) {
      _offset++;
      await fetchPokemonUrl(_offset * 20);
    }
  }

  @action
  int setItemCount() {
    itemCount = (listPokemon.length < 1096 && !isSearching)
        ? listPokemon.length + 1
        : listPokemon.length;

    return itemCount;
  }

  @action
  bool canSetOffset(int index) {
    if (index == listPokemon.length && listPokemon.length < 1096) {
      setOffset();
      return true;
    }
    return false;
  }

  @action
  void searchAbility(List<Ability?> list) {
    _listAbility.clear();
    list.forEach((ability) {
      fetchPokemonAbility(url: ability!.ability.url);
    });
  }

  @action
  void searchType(List<Type> list) {
    _listType.clear();
    for (var type in list) {
      fetchPokemonType(url: type.type.url);
    }
  }
}
