// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/controller/pokelist_store.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/screens/detail/detail_screen.dart';
import 'package:projeto_estagio/screens/home/widgets/search_header.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';
import 'package:projeto_estagio/widgets/loading_widget.dart';
import 'package:projeto_estagio/widgets/type_widget.dart';

import '../../r.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PokeListStore _pokeStore = PokeListStore();
  final TextEditingController _textEditingController = TextEditingController();
  final snackBar = SnackBar(
    content: Text('Nome muito pequeno'),
    duration: Duration(seconds: 3),
    action: SnackBarAction(
      label: 'Desfazer',
      textColor: ColorsUtil.primaryYellow,
      onPressed: () {},
    ),
  );

  @override
  void initState() {
    super.initState();
    if (_pokeStore.pokeUrl == null) {
      _pokeStore.fetchPokemonUrl(_pokeStore.getOfsset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsUtil.appBackground,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      child: Container(
        color: ColorsUtil.appBackground,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Observer(builder: (BuildContext context) {
            return Column(
              children: [
                SearchHeader(
                    isSearchValid: _pokeStore.isSearchValid,
                    controller: _textEditingController,
                    onChanged: _pokeStore.onChangedText,
                    isEmpty: _pokeStore.isEmpty,
                    onTapClear: () =>
                        _pokeStore.onTapClear(_textEditingController),
                    onTapSearch: () {
                      _pokeStore.onTapSearch(snackBar);
                      if (!_pokeStore.isSearchValid) {
                        Scaffold.of(context).showSnackBar(snackBar);
                      }
                    }),
                Visibility(
                    visible: _pokeStore.isVibile,
                    replacement: LoadingWidget(),
                    child: _buildList())
              ],
            );
          }),
        ),
      ),
    );
  }

  Expanded _buildList() {
    return Expanded(
      child: (_pokeStore.pokeUrl != null && _pokeStore.listPokemon.isNotEmpty)
          ? GridView.builder(
              padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
              addRepaintBoundaries: true,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 151 / 107,
                mainAxisSpacing: 19,
                crossAxisSpacing: 19,
                crossAxisCount: 2,
              ),
              itemCount: _pokeStore.setItemCount(),
              itemBuilder: (context, index) {
                if (_pokeStore.canSetOffset(index)) {
                  return LoadingWidget();
                }

                Details? details = _pokeStore.listPokemon[index];
                return _card(
                    details, details?.name, details!.types[0].type.name);
              })
          : _errorWidget(),
    );
  }

  Container _errorWidget() {
    return Container(
      // height: 630,
      padding: EdgeInsets.only(top: 125),
      child: Column(
        children: [
          Text(
            'Não encontramos pokemons com este nome',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsUtil.primaryYellow,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 14),
            width: 151,
            height: 151,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(R.assetsPokeballError)),
            ),
          ),
        ],
      ),
    );
  }

  InkWell _card(Details? details, String? pokemonName, String typeName) {
    final typeColor = ColorsUtil.getColorByType(type: typeName);
    return InkWell(
      onTap: () async {
        _pokeStore.searchAbility(details!.abilities!);
        _pokeStore.searchType(details.types);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(
                  pokemon: details,
                  image: details.sprites!.other!.officialArtwork.frontDefault,
                  typeName: typeName,
                  color: ColorsUtil.getColorByType(type: typeName),
                  store: _pokeStore,
                  typeDetailed: _pokeStore.listType,
                  skeletonCount: details.abilities!.length,
                )));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(11, 0, 0, 0),
        decoration: BoxDecoration(
            color: typeColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: typeColor.withOpacity(0.6),
                spreadRadius: 0.1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              )
            ]),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  FuncUtil.capitalize('$pokemonName'),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 14,
                ),
                TypeWidget(
                  typeName: typeName,
                  width: 21,
                  height: 64,
                  fontSize: 10,
                ),
              ],
            ),
            Positioned(
              top: 5,
              right: -11,
              child: Hero(
                tag: 'pokemon-img-$pokemonName',
                child: CachedNetworkImage(
                  imageUrl:
                      details!.sprites!.other!.officialArtwork.frontDefault,
                  alignment: Alignment.topRight,
                  fit: BoxFit.cover,
                  width: 81,
                  height: 81,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
