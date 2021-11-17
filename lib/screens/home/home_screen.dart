import 'package:flutter/material.dart';
import 'package:projeto_estagio/controller/pokelist_store.dart';
import 'package:projeto_estagio/model/pokelist_model.dart';
import 'package:projeto_estagio/screens/home/widgets/search_header.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_estagio/utils/colors_util.dart';

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
      _pokeListStore.pokeDetail;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pokeListStore.pokeDetail?.types;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.appBackground,
      body: _buildBody(),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
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
        ),
      ),
    );
  }

  Observer _buildList() {
    return Observer(builder: (BuildContext context) {
      return (_pokeListStore.pokeList != null)
          ? GridView.builder(
              padding: const EdgeInsets.all(16.0),
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
              ),
              itemCount: _pokeListStore.pokeList!.results.length,
              itemBuilder: (context, index) {
                var pokemon = _pokeListStore.pokeList!.results[index].name;
                var indexPokemon = _pokeListStore.pokeList!.results[index].url
                    .split('/')
                    .elementAt(6);
                _pokeListStore.fetchPokemonDetail(index: indexPokemon);
                var type = _pokeListStore.pokeDetail?.types[0].type.name;
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 97,
                  width: 140,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 1,
                        ),
                        Text(
                          pokemon,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        ),
                        Image.network(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$indexPokemon.png',
                          // fit: BoxFit.contain,
                          alignment: Alignment.topRight,
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
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