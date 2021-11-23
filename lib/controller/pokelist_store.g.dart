// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokelist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeListStore on _PokeListStoreBase, Store {
  Computed<bool>? _$getSearchComputed;

  @override
  bool get getSearch =>
      (_$getSearchComputed ??= Computed<bool>(() => super.getSearch,
              name: '_PokeListStoreBase.getSearch'))
          .value;
  Computed<ObservableList<Details?>>? _$listPokemonComputed;

  @override
  ObservableList<Details?> get listPokemon => (_$listPokemonComputed ??=
          Computed<ObservableList<Details?>>(() => super.listPokemon,
              name: '_PokeListStoreBase.listPokemon'))
      .value;
  Computed<ObservableList<Details?>>? _$listSearchComputed;

  @override
  ObservableList<Details?> get listSearch => (_$listSearchComputed ??=
          Computed<ObservableList<Details?>>(() => super.listSearch,
              name: '_PokeListStoreBase.listSearch'))
      .value;
  Computed<PokeList?>? _$pokeUrlComputed;

  @override
  PokeList? get pokeUrl =>
      (_$pokeUrlComputed ??= Computed<PokeList?>(() => super.pokeUrl,
              name: '_PokeListStoreBase.pokeUrl'))
          .value;
  Computed<Details?>? _$pokeDetailComputed;

  @override
  Details? get pokeDetail =>
      (_$pokeDetailComputed ??= Computed<Details?>(() => super.pokeDetail,
              name: '_PokeListStoreBase.pokeDetail'))
          .value;

  final _$_searchAtom = Atom(name: '_PokeListStoreBase._search');

  @override
  String get _search {
    _$_searchAtom.reportRead();
    return super._search;
  }

  @override
  set _search(String value) {
    _$_searchAtom.reportWrite(value, super._search, () {
      super._search = value;
    });
  }

  final _$_listSearchAtom = Atom(name: '_PokeListStoreBase._listSearch');

  @override
  ObservableList<Details?> get _listSearch {
    _$_listSearchAtom.reportRead();
    return super._listSearch;
  }

  @override
  set _listSearch(ObservableList<Details?> value) {
    _$_listSearchAtom.reportWrite(value, super._listSearch, () {
      super._listSearch = value;
    });
  }

  final _$_listPokemonAtom = Atom(name: '_PokeListStoreBase._listPokemon');

  @override
  ObservableList<Details?> get _listPokemon {
    _$_listPokemonAtom.reportRead();
    return super._listPokemon;
  }

  @override
  set _listPokemon(ObservableList<Details?> value) {
    _$_listPokemonAtom.reportWrite(value, super._listPokemon, () {
      super._listPokemon = value;
    });
  }

  final _$_pokemonDetailAtom = Atom(name: '_PokeListStoreBase._pokemonDetail');

  @override
  Details? get _pokemonDetail {
    _$_pokemonDetailAtom.reportRead();
    return super._pokemonDetail;
  }

  @override
  set _pokemonDetail(Details? value) {
    _$_pokemonDetailAtom.reportWrite(value, super._pokemonDetail, () {
      super._pokemonDetail = value;
    });
  }

  final _$_pokemonsUrlAtom = Atom(name: '_PokeListStoreBase._pokemonsUrl');

  @override
  PokeList? get _pokemonsUrl {
    _$_pokemonsUrlAtom.reportRead();
    return super._pokemonsUrl;
  }

  @override
  set _pokemonsUrl(PokeList? value) {
    _$_pokemonsUrlAtom.reportWrite(value, super._pokemonsUrl, () {
      super._pokemonsUrl = value;
    });
  }

  final _$_PokeListStoreBaseActionController =
      ActionController(name: '_PokeListStoreBase');

  @override
  String setNewSearch(String value) {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.setNewSearch');
    try {
      return super.setNewSearch(value);
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListSearch() {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.setListSearch');
    try {
      return super.setListSearch();
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHomeList() {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.setHomeList');
    try {
      return super.setHomeList();
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchPokemonDetail({required String url}) {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.fetchPokemonDetail');
    try {
      return super.fetchPokemonDetail(url: url);
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchPokemonUrl() {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.fetchPokemonUrl');
    try {
      return super.fetchPokemonUrl();
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getSearch: ${getSearch},
listPokemon: ${listPokemon},
listSearch: ${listSearch},
pokeUrl: ${pokeUrl},
pokeDetail: ${pokeDetail}
    ''';
  }
}
