import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/controller/pokelist_store.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {Key? key, required this.pokemonName, required this.indexPokemon})
      : super(key: key);
  final String pokemonName;
  final String indexPokemon;

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final PokeListStore _pokeListStore = PokeListStore();

  @override
  void initState() {
    super.initState();
    if (_pokeListStore.pokeDetail == null) {
      _pokeListStore.fetchPokemonDetail(index: widget.indexPokemon);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        var type = _pokeListStore.pokeDetail!.types[0].type.name;

        return Container(
          decoration: BoxDecoration(
            color: ColorsUtil.getColorByType(type: type),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FuncUtil.capitalize(widget.pokemonName),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      FuncUtil.capitalize(type),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                CachedNetworkImage(
                  imageUrl: FuncUtil.findImage(widget.indexPokemon),
                  alignment: Alignment.centerRight,
                  width: 79,
                  height: 79,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
