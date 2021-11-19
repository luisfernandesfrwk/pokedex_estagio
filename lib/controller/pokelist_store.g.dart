// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokelist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeListStore on _PokeListStoreBase, Store {
  Computed<List<Details?>>? _$listPokemonComputed;

  @override
  List<Details?> get listPokemon => (_$listPokemonComputed ??=
          Computed<List<Details?>>(() => super.listPokemon,
              name: '_PokeListStoreBase.listPokemon'))
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

  final _$_listPokemonAtom = Atom(name: '_PokeListStoreBase._listPokemon');

  @override
  List<Details?> get _listPokemon {
    _$_listPokemonAtom.reportRead();
    return super._listPokemon;
  }

  @override
  set _listPokemon(List<Details?> value) {
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
listPokemon: ${listPokemon},
pokeUrl: ${pokeUrl},
pokeDetail: ${pokeDetail}
    ''';
  }
}
