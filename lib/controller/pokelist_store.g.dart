// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokelist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeListStore on _PokeListStoreBase, Store {
  Computed<ObservableList<Details?>>? _$listPokemonComputed;

  @override
  ObservableList<Details?> get listPokemon => (_$listPokemonComputed ??=
          Computed<ObservableList<Details?>>(() => super.listPokemon,
              name: '_PokeListStoreBase.listPokemon'))
      .value;
  Computed<PokeUrl?>? _$pokeUrlComputed;

  @override
  PokeUrl? get pokeUrl =>
      (_$pokeUrlComputed ??= Computed<PokeUrl?>(() => super.pokeUrl,
              name: '_PokeListStoreBase.pokeUrl'))
          .value;
  Computed<Details?>? _$pokeDetailComputed;

  @override
  Details? get pokeDetail =>
      (_$pokeDetailComputed ??= Computed<Details?>(() => super.pokeDetail,
              name: '_PokeListStoreBase.pokeDetail'))
          .value;
  Computed<bool>? _$isSearchingComputed;

  @override
  bool get isSearching =>
      (_$isSearchingComputed ??= Computed<bool>(() => super.isSearching,
              name: '_PokeListStoreBase.isSearching'))
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

  final _$_searchingAtom = Atom(name: '_PokeListStoreBase._searching');

  @override
  bool get _searching {
    _$_searchingAtom.reportRead();
    return super._searching;
  }

  @override
  set _searching(bool value) {
    _$_searchingAtom.reportWrite(value, super._searching, () {
      super._searching = value;
    });
  }

  final _$itemCountAtom = Atom(name: '_PokeListStoreBase.itemCount');

  @override
  int get itemCount {
    _$itemCountAtom.reportRead();
    return super.itemCount;
  }

  @override
  set itemCount(int value) {
    _$itemCountAtom.reportWrite(value, super.itemCount, () {
      super.itemCount = value;
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
  PokeUrl? get _pokemonsUrl {
    _$_pokemonsUrlAtom.reportRead();
    return super._pokemonsUrl;
  }

  @override
  set _pokemonsUrl(PokeUrl? value) {
    _$_pokemonsUrlAtom.reportWrite(value, super._pokemonsUrl, () {
      super._pokemonsUrl = value;
    });
  }

  final _$onTapSearchAsyncAction =
      AsyncAction('_PokeListStoreBase.onTapSearch');

  @override
  Future<dynamic> onTapSearch(SnackBar snackBar) {
    return _$onTapSearchAsyncAction.run(() => super.onTapSearch(snackBar));
  }

  final _$setOffsetAsyncAction = AsyncAction('_PokeListStoreBase.setOffset');

  @override
  Future<dynamic> setOffset() {
    return _$setOffsetAsyncAction.run(() => super.setOffset());
  }

  final _$_PokeListStoreBaseActionController =
      ActionController(name: '_PokeListStoreBase');

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
  void onTapClear(TextEditingController controller) {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.onTapClear');
    try {
      return super.onTapClear(controller);
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchPokemonDetail({required String name}) {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.fetchPokemonDetail');
    try {
      return super.fetchPokemonDetail(name: name);
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
  int setItemCount() {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.setItemCount');
    try {
      return super.setItemCount();
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool canSetOffset(int index) {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.canSetOffset');
    try {
      return super.canSetOffset(index);
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemCount: ${itemCount},
search: ${search},
listPokemon: ${listPokemon},
pokeUrl: ${pokeUrl},
pokeDetail: ${pokeDetail},
isSearching: ${isSearching},
isSearchValid: ${isSearchValid},
isEmpty: ${isEmpty}
    ''';
  }
}
