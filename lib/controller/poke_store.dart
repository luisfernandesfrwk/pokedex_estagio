import 'package:mobx/mobx.dart';
part 'poke_store.g.dart';

class PokeStore = _PokeStoreBase with _$PokeStore;

abstract class _PokeStoreBase with Store {}
