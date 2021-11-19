import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/controller/pokelist_store.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/screens/home/widgets/search_header.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PokeListStore _pokeStore = PokeListStore();

  @override
  void initState() {
    super.initState();
    if (_pokeStore.pokeUrl == null) {
      _pokeStore.fetchPokemonUrl();

      _pokeStore.listPokemon
          .sort((a, b) => a!.id!.toInt().compareTo(a.id!.toInt()));
      _pokeStore.listPokemon;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pokeStore.listPokemon;

    _pokeStore.listPokemon
        .sort((a, b) => a!.id!.toInt().compareTo(a.id!.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.appBackground,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      color: ColorsUtil.appBackground,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SearchHeader(),
            Expanded(child: _buildList()),
          ],
        ),
      ),
    );
  }

  Observer _buildList() {
    return Observer(builder: (BuildContext context) {
      return (_pokeStore.pokeUrl != null && _pokeStore.listPokemon.isNotEmpty)
          ? GridView.builder(
              padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: true,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
              ),
              itemCount: _pokeStore.listPokemon
                  .length, //_pokeListStore.pokeList!.results.length,
              itemBuilder: (context, index) {
                Details? details = _pokeStore.listPokemon[index];
                var pokemonName = details?.name;
                _pokeStore.listPokemon
                    .sort((a, b) => a!.id!.toInt().compareTo(b!.id!.toInt()));

                return Container(
                  decoration: BoxDecoration(
                    color: ColorsUtil.getColorByType(
                        type: details!.types[0].type.name),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 120,
                  width: 120,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    overflow: Overflow.visible,
                    fit: StackFit.expand,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FuncUtil.capitalize('$pokemonName'),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  FuncUtil.capitalize(
                                      details.types[0].type.name),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -20,
                        child: CachedNetworkImage(
                          imageUrl: details
                              .sprites!.other!.officialArtwork.frontDefault,
                          alignment: Alignment.topRight,
                          fit: BoxFit.cover,
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ],
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}




// ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemCount: _pokeListStore.pokeList!.results.length,
//               itemBuilder: (context, index) {
//                 var pokemon = _pokeListStore.pokeList!.results[index++].name;
//                 return Row(
//                   children: [
//                     Card(
//                       margin: const EdgeInsets.fromLTRB(20, 16, 8, 8),
//                       child: Container(
//                         height: 97,
//                         width: 140,
//                         child: Center(
//                           child: Text(pokemon),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               })