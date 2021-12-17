// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokedexStore on _PokedexStoreBase, Store {
  Computed<ObservableList<TypeDetailed?>>? _$listTypeComputed;

  @override
  ObservableList<TypeDetailed?> get listType => (_$listTypeComputed ??=
          Computed<ObservableList<TypeDetailed?>>(() => super.listType,
              name: '_PokedexStoreBase.listType'))
      .value;
  Computed<ObservableList<Abilities?>>? _$listAbilityComputed;

  @override
  ObservableList<Abilities?> get listAbility => (_$listAbilityComputed ??=
          Computed<ObservableList<Abilities?>>(() => super.listAbility,
              name: '_PokedexStoreBase.listAbility'))
      .value;
  Computed<ObservableList<Details?>>? _$listPokemonComputed;

  @override
  ObservableList<Details?> get listPokemon => (_$listPokemonComputed ??=
          Computed<ObservableList<Details?>>(() => super.listPokemon,
              name: '_PokedexStoreBase.listPokemon'))
      .value;
  Computed<PokeUrl?>? _$pokeUrlComputed;

  @override
  PokeUrl? get pokeUrl =>
      (_$pokeUrlComputed ??= Computed<PokeUrl?>(() => super.pokeUrl,
              name: '_PokedexStoreBase.pokeUrl'))
          .value;
  Computed<Details?>? _$pokeDetailComputed;

  @override
  Details? get pokeDetail =>
      (_$pokeDetailComputed ??= Computed<Details?>(() => super.pokeDetail,
              name: '_PokedexStoreBase.pokeDetail'))
          .value;
  Computed<int>? _$getOfssetComputed;

  @override
  int get getOfsset =>
      (_$getOfssetComputed ??= Computed<int>(() => super.getOfsset,
              name: '_PokedexStoreBase.getOfsset'))
          .value;
  Computed<bool>? _$isVibileComputed;

  @override
  bool get isVibile =>
      (_$isVibileComputed ??= Computed<bool>(() => super.isVibile,
              name: '_PokedexStoreBase.isVibile'))
          .value;
  Computed<bool>? _$isSearchingComputed;

  @override
  bool get isSearching =>
      (_$isSearchingComputed ??= Computed<bool>(() => super.isSearching,
              name: '_PokedexStoreBase.isSearching'))
          .value;
  Computed<bool>? _$isSearchValidComputed;

  @override
  bool get isSearchValid =>
      (_$isSearchValidComputed ??= Computed<bool>(() => super.isSearchValid,
              name: '_PokedexStoreBase.isSearchValid'))
          .value;
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??= Computed<bool>(() => super.isEmpty,
          name: '_PokedexStoreBase.isEmpty'))
      .value;

  final _$_visibleAtom = Atom(name: '_PokedexStoreBase._visible');

  @override
  bool get _visible {
    _$_visibleAtom.reportRead();
    return super._visible;
  }

  @override
  set _visible(bool value) {
    _$_visibleAtom.reportWrite(value, super._visible, () {
      super._visible = value;
    });
  }

  final _$_searchingAtom = Atom(name: '_PokedexStoreBase._searching');

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

  final _$itemCountAtom = Atom(name: '_PokedexStoreBase.itemCount');

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

  final _$_offsetAtom = Atom(name: '_PokedexStoreBase._offset');

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

  final _$searchAtom = Atom(name: '_PokedexStoreBase.search');

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

  final _$_listTypeAtom = Atom(name: '_PokedexStoreBase._listType');

  @override
  ObservableList<TypeDetailed?> get _listType {
    _$_listTypeAtom.reportRead();
    return super._listType;
  }

  @override
  set _listType(ObservableList<TypeDetailed?> value) {
    _$_listTypeAtom.reportWrite(value, super._listType, () {
      super._listType = value;
    });
  }

  final _$_listAbilityAtom = Atom(name: '_PokedexStoreBase._listAbility');

  @override
  ObservableList<Abilities?> get _listAbility {
    _$_listAbilityAtom.reportRead();
    return super._listAbility;
  }

  @override
  set _listAbility(ObservableList<Abilities?> value) {
    _$_listAbilityAtom.reportWrite(value, super._listAbility, () {
      super._listAbility = value;
    });
  }

  final _$_listPokemonAtom = Atom(name: '_PokedexStoreBase._listPokemon');

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

  final _$_pokemonDetailAtom = Atom(name: '_PokedexStoreBase._pokemonDetail');

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

  final _$_pokemonsUrlAtom = Atom(name: '_PokedexStoreBase._pokemonsUrl');

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

  final _$onTapSearchAsyncAction = AsyncAction('_PokedexStoreBase.onTapSearch');

  @override
  Future<dynamic> onTapSearch(SnackBar snackBar) {
    return _$onTapSearchAsyncAction.run(() => super.onTapSearch(snackBar));
  }

  final _$setOffsetAsyncAction = AsyncAction('_PokedexStoreBase.setOffset');

  @override
  Future<dynamic> setOffset() {
    return _$setOffsetAsyncAction.run(() => super.setOffset());
  }

  final _$_PokedexStoreBaseActionController =
      ActionController(name: '_PokedexStoreBase');

  @override
  void onChangedText(String value) {
    final _$actionInfo = _$_PokedexStoreBaseActionController.startAction(
        name: '_PokedexStoreBase.onChangedText');
    try {
      return super.onChangedText(value);
    } finally {
      _$_PokedexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapClear(TextEditingController controller) {
    final _$actionInfo = _$_PokedexStoreBaseActionController.startAction(
        name: '_PokedexStoreBase.onTapClear');
    try {
      return super.onTapClear(controller);
    } finally {
      _$_PokedexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchPokemonType({required String url}) {
    final _$actionInfo = _$_PokedexStoreBaseActionController.startAction(
        name: '_PokedexStoreBase.fetchPokemonType');
    try {
      return super.fetchPokemonType(url: url);
    } finally {
      _$_PokedexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchPokemonAbility({required String url}) {
    final _$actionInfo = _$_PokedexStoreBaseActionController.startAction(
        name: '_PokedexStoreBase.fetchPokemonAbility');
    try {
      return super.fetchPokemonAbility(url: url);
    } finally {
      _$_PokedexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchPokemonDetail({required String name}) {
    final _$actionInfo = _$_PokedexStoreBaseActionController.startAction(
        name: '_PokedexStoreBase.fetchPokemonDetail');
    try {
      return super.fetchPokemonDetail(name: name);
    } finally {
      _$_PokedexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchPokemonUrl(int offset) {
    final _$actionInfo = _$_PokedexStoreBaseActionController.startAction(
        name: '_PokedexStoreBase.fetchPokemonUrl');
    try {
      return super.fetchPokemonUrl(offset);
    } finally {
      _$_PokedexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int setItemCount() {
    final _$actionInfo = _$_PokedexStoreBaseActionController.startAction(
        name: '_PokedexStoreBase.setItemCount');
    try {
      return super.setItemCount();
    } finally {
      _$_PokedexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool canSetOffset(int index) {
    final _$actionInfo = _$_PokedexStoreBaseActionController.startAction(
        name: '_PokedexStoreBase.canSetOffset');
    try {
      return super.canSetOffset(index);
    } finally {
      _$_PokedexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchAbility(List<Ability?> list) {
    final _$actionInfo = _$_PokedexStoreBaseActionController.startAction(
        name: '_PokedexStoreBase.searchAbility');
    try {
      return super.searchAbility(list);
    } finally {
      _$_PokedexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchType(List<Type> list) {
    final _$actionInfo = _$_PokedexStoreBaseActionController.startAction(
        name: '_PokedexStoreBase.searchType');
    try {
      return super.searchType(list);
    } finally {
      _$_PokedexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemCount: ${itemCount},
search: ${search},
listType: ${listType},
listAbility: ${listAbility},
listPokemon: ${listPokemon},
pokeUrl: ${pokeUrl},
pokeDetail: ${pokeDetail},
getOfsset: ${getOfsset},
isVibile: ${isVibile},
isSearching: ${isSearching},
isSearchValid: ${isSearchValid},
isEmpty: ${isEmpty}
    ''';
  }
}
