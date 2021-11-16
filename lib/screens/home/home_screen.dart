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
    _pokeListStore.fetchPokemonList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Container(
        color: ColorsUtil.appBackground,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              const SearchHeader(),
              _buildList(),
            ],
          ),
        ),
      ),
    );
  }

  Observer _buildList() {
    return Observer(builder: (BuildContext context) {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _pokeListStore.pokemonsList?.count,
          itemBuilder: (context, index) {
            var pokemon = _pokeListStore.pokemonsList;
            if (pokemon != null) {
              return Row(
                children: [
                  Card(
                    margin: const EdgeInsets.fromLTRB(20, 16, 8, 8),
                    child: Container(
                      height: 97,
                      width: 140,
                      child: Center(
                        child: Text(
                            _pokeListStore.pokemonsList!.results[index].name),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Loading'));
            }
          });
    });
  }
}

// return ListView.builder(
//                         physics: const NeverScrollableScrollPhysics(),
//                         scrollDirection: Axis.vertical,
//                         shrinkWrap: true,
//                         itemCount: 10,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Row(
//                             children: [
//                               Card(
//                                   margin:
//                                       const EdgeInsets.fromLTRB(20, 16, 8, 8),
//                                   child: Container(
//                                     height: 97,
//                                     width: 140,
//                                     child: Center(child: Text('pokemon')),
//                                   )),
//                               Card(
//                                   margin:
//                                       const EdgeInsets.fromLTRB(16, 16, 8, 8),
//                                   child: Container(
//                                     height: 97,
//                                     width: 140,
//                                     child: Center(child: Text('pokemon')),
//                                   )),
//                             ],
//                           );
//                         });