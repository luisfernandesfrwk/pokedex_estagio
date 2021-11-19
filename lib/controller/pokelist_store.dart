import 'package:mobx/mobx.dart';
import 'package:projeto_estagio/api/poke_api.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
import 'package:projeto_estagio/utils/consts_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';
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

  Future<PokeList?> findAllPokemons() async {
    try {
      final response =
          await FuncUtil.getUrl('${Consts.baseUrl}?offset=0&limit=1118');
      final type = await findPokemon(
              index: PokeList.fromMap(response.data).results.length.toString())
          .then((value) => _pokemonDetail = value);
      print(type);
      return PokeList.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<Details?> findPokemon({required String index}) async {
    try {
      final response =
          await FuncUtil.getUrl(Consts.baseUrl + index).then((value) {});

      return Details.fromMap(response.data);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }
}
