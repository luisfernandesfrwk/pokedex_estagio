// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokelist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeListStore on _PokeListStoreBase, Store {
  final _$pokemonsListAtom = Atom(name: '_PokeListStoreBase.pokemonsList');

  @override
  PokeList? get pokemonsList {
    _$pokemonsListAtom.reportRead();
    return super.pokemonsList;
  }

  @override
  set pokemonsList(PokeList? value) {
    _$pokemonsListAtom.reportWrite(value, super.pokemonsList, () {
      super.pokemonsList = value;
    });
  }

  final _$_PokeListStoreBaseActionController =
      ActionController(name: '_PokeListStoreBase');

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
pokemonsList: ${pokemonsList}
    ''';
  }
}
