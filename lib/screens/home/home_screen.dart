import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/controller/pokelist_store.dart';
import 'package:projeto_estagio/screens/home/widgets/custom_card.dart';
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
  final PokeListStore _pokeListStore = PokeListStore();

  @override
  void initState() {
    super.initState();
    if (_pokeListStore.pokeList == null) {
      _pokeListStore.fetchPokemonList();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pokeListStore.pokeDetail;
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
        padding: const EdgeInsets.all(32.0),
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
      return (_pokeListStore.pokeList != null)
          ? GridView.builder(
              padding: const EdgeInsets.all(16.0),
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: true,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
              ),
              itemCount: 8, //_pokeListStore.pokeList!.results.length,
              itemBuilder: (context, index) {
                var pokemon = _pokeListStore.pokeList!.results[index].name;
                var indexPokemon = _pokeListStore.pokeList!.results[index].url
                    .split('/')
                    .elementAt(6);

                return CustomCard(
                  indexPokemon: indexPokemon,
                  pokemonName: pokemon,
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