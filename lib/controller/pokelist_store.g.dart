// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokelist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeListStore on _PokeListStoreBase, Store {
  Computed<bool>? _$endComputed;

  @override
  bool get end => (_$endComputed ??=
          Computed<bool>(() => super.end, name: '_PokeListStoreBase.end'))
      .value;
  Computed<bool>? _$isSearchValidComputed;

  @override
  bool get isSearchValid =>
      (_$isSearchValidComputed ??= Computed<bool>(() => super.isSearchValid,
              name: '_PokeListStoreBase.isSearchValid'))
          .value;
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??= Computed<bool>(() => super.isEmpty,
          name: '_PokeListStoreBase.isEmpty'))
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

  final _$_endOfListAtom = Atom(name: '_PokeListStoreBase._endOfList');

  @override
  bool get _endOfList {
    _$_endOfListAtom.reportRead();
    return super._endOfList;
  }

  @override
  set _endOfList(bool value) {
    _$_endOfListAtom.reportWrite(value, super._endOfList, () {
      super._endOfList = value;
    });
  }

  final _$_offsetAtom = Atom(name: '_PokeListStoreBase._offset');

  @override
  int get _offset {
    _$_offsetAtom.reportRead();
    return super._offset;
  }

  @override
  set _offset(int value) {
    _$_offsetAtom.reportWrite(value, super._offset, () {
      super._offset = value;
    });
  }

  final _$searchAtom = Atom(name: '_PokeListStoreBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
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

  final _$setOffsetAsyncAction = AsyncAction('_PokeListStoreBase.setOffset');

  @override
  Future<dynamic> setOffset() {
    return _$setOffsetAsyncAction.run(() => super.setOffset());
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
  void clear(TextEditingController controller) {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.clear');
    try {
      return super.clear(controller);
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangedText(String value) {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.onChangedText');
    try {
      return super.onChangedText(value);
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
  Future<dynamic> fetchPokemonUrl(int offset) {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.fetchPokemonUrl');
    try {
      return super.fetchPokemonUrl(offset);
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
end: ${end},
isSearchValid: ${isSearchValid},
isEmpty: ${isEmpty},
listPokemon: ${listPokemon},
listSearch: ${listSearch},
pokeUrl: ${pokeUrl},
pokeDetail: ${pokeDetail}
    ''';
  }
}
