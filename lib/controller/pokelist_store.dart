import 'package:mobx/mobx.dart';
import 'package:projeto_estagio/api/poke_api.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
part 'pokelist_store.g.dart';

class PokeListStore = _PokeListStoreBase with _$PokeListStore;

abstract class _PokeListStoreBase with Store {
  final PokeApi _pokeApi = PokeApi();

  @observable
  PokeList? pokemonsList;

  @action
  Future fetchPokemonList() => _pokeApi.findAllPokemons().then((pokemons) {
        pokemonsList = pokemons;
      }).onError((error, stackTrace) {
        print(error);
      });
}
