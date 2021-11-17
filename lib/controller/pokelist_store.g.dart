// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokelist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeListStore on _PokeListStoreBase, Store {
  Computed<PokeList?>? _$pokeListComputed;

  @override
  PokeList? get pokeList =>
      (_$pokeListComputed ??= Computed<PokeList?>(() => super.pokeList,
              name: '_PokeListStoreBase.pokeList'))
          .value;
  Computed<Details?>? _$pokeDetailComputed;

  @override
  Details? get pokeDetail =>
      (_$pokeDetailComputed ??= Computed<Details?>(() => super.pokeDetail,
              name: '_PokeListStoreBase.pokeDetail'))
          .value;

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

  final _$_pokemonsListAtom = Atom(name: '_PokeListStoreBase._pokemonsList');

  @override
  PokeList? get _pokemonsList {
    _$_pokemonsListAtom.reportRead();
    return super._pokemonsList;
  }

  @override
  set _pokemonsList(PokeList? value) {
    _$_pokemonsListAtom.reportWrite(value, super._pokemonsList, () {
      super._pokemonsList = value;
    });
  }

  final _$_PokeListStoreBaseActionController =
      ActionController(name: '_PokeListStoreBase');

  @override
  Future<dynamic> fetchPokemonDetail({required String index}) {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.fetchPokemonDetail');
    try {
      return super.fetchPokemonDetail(index: index);
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchPokemonList() {
    final _$actionInfo = _$_PokeListStoreBaseActionController.startAction(
        name: '_PokeListStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokeList: ${pokeList},
pokeDetail: ${pokeDetail}
    ''';
  }
}
