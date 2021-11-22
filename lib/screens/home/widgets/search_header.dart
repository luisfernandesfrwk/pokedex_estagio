import 'package:flutter/material.dart';
import 'package:projeto_estagio/controller/pokelist_store.dart';
import 'package:projeto_estagio/r.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  final TextEditingController _textEditingController = TextEditingController();
  final PokeListStore _pokeStore = PokeListStore();
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          width: 165,
          height: 60,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(R.assetsPokemonLogo), fit: BoxFit.fill),
          ),
        ), //arrumar isso aqui depois :)
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(32, 1, 15, 0),
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                spreadRadius: 0.6,
                blurRadius: 2,
                offset: const Offset(0, 2),
              )
            ],
            shape: BoxShape.rectangle,
            color: ColorsUtil.textFieldBackground,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: _textField(),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Observer _textField() {
    return Observer(builder: (_) {
      return TextField(
        controller: _textEditingController,
        onChanged: _pokeStore.setSearch,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          hintText: "Busque por um pokemon",
          border: InputBorder.none,
          suffixIconConstraints: const BoxConstraints.tightFor(
            width: 35,
            height: 35,
          ),
          suffixIcon: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Material(
              color: ColorsUtil.primaryYellow,
              child: InkWell(
                child: Icon(
                  Icons.search,
                  size: 25,
                  color: ColorsUtil.searchIcon,
                ),
                onTap: () {
                  _pokeStore.setList();
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
