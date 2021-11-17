import 'package:mobx/mobx.dart';
import 'package:projeto_estagio/api/poke_api.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
part 'pokelist_store.g.dart';

class PokeListStore = _PokeListStoreBase with _$PokeListStore;

abstract class _PokeListStoreBase with Store {
  final PokeApi _pokeApi = PokeApi();

  @observable
  Details? _pokemonDetail;

  @observable
  PokeList? _pokemonsList;

  @computed
  PokeList? get pokeList => _pokemonsList;

  @computed
  Details? get pokeDetail => _pokemonDetail;

  @action
  Future fetchPokemonDetail({required String index}) => _pokeApi
          .findPokemon(index: index)
          .then((details) => _pokemonDetail = details)
          .onError((error, stackTrace) {
        print(error);
      });

  @action
  Future fetchPokemonList() => _pokeApi.findAllPokemons().then((pokemons) {
        _pokemonsList = pokemons;
      }).onError((error, stackTrace) {
        print(error);
      });
}
