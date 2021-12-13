import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_estagio/controller/pokedex_store.dart';
import 'package:pokedex_estagio/model/details_model.dart';
import 'package:pokedex_estagio/model/typedetailed_model.dart';
import 'package:pokedex_estagio/screens/detail/widgets/habilidades_widget.dart';
import 'package:pokedex_estagio/screens/detail/widgets/movimentos_widget.dart';
import 'package:pokedex_estagio/screens/detail/widgets/tipos_widget.dart';
import 'package:pokedex_estagio/utils/colors_util.dart';
import 'package:pokedex_estagio/utils/func_util.dart';
import 'package:pokedex_estagio/widgets/type_widget.dart';

import '../../r.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.pokemon,
    required this.image,
    required this.typeName,
    required this.color,
    required this.typeDetailed,
    required this.store,
    required this.skeletonCount,
  }) : super(key: key);

  final Details? pokemon;
  final String image;
  final String typeName;
  final Color color;
  final List<TypeDetailed?> typeDetailed;
  final PokedexStore store;
  final int skeletonCount;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _strokeText(
            text: FuncUtil.capitalize(widget.pokemon!.name!), fontSize: 26),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
          iconSize: 17,
        ),
      ),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      color: widget.color,
      // padding: const EdgeInsets.only(top: 300),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 138,
                height: 308.444,
                padding: const EdgeInsets.only(top: 97),
                child: Column(
                  children: [
                    TypeWidget(
                      typeName: widget.typeName,
                      width: 39,
                      height: 119,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    _statWidget(
                        image: R.assetsHpstat,
                        stat: widget.pokemon!.stats![0].baseStat.toString()),
                    _statWidget(
                        image: R.assetsAtkstat,
                        stat: widget.pokemon!.stats![1].baseStat.toString()),
                    _statWidget(
                        image: R.assetsDeffstat,
                        stat: widget.pokemon!.stats![2].baseStat.toString()),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 60),
                width: 246,
                height: 308.444,
                child: Hero(
                  tag: 'pokemon-img-${widget.pokemon!.name}',
                  child: CachedNetworkImage(
                    imageUrl: widget.image,
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorsUtil.appBackground,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: TabBar(
              padding: const EdgeInsets.only(top: 10),

              indicatorWeight: 3.2,
              indicatorPadding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              indicatorColor: widget.color,
              unselectedLabelColor: widget.color,
              labelColor: widget.color,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                const Tab(text: 'Habilidades'),
                const Tab(text: 'Tipos'),
                const Tab(text: 'Movimentos')
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Expanded(
            child: TabBarView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                HabilidadesWidget(
                  abilities: widget.store.listAbility,
                  color: widget.color,
                  skeletonCount: widget.skeletonCount,
                ),
                TiposWidget(
                  type: widget.pokemon!.types,
                  color: widget.color,
                  typeDetailed: widget.store.listType,
                ),
                MovimentosWidget(
                    moves: widget.pokemon!.moves, color: widget.color),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statWidget({required String image, required String stat}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 2, 16, 0),
      margin: const EdgeInsets.only(bottom: 5),
      height: 28,
      width: 75,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: ColorsUtil.getColorByHex('FFFFFF').withOpacity(0.3),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            width: 20,
            height: 20,
          ),
          (stat.length > 2)
              ? _strokeText(text: stat, fontSize: 15)
              : _strokeText(text: stat, fontSize: 18),
        ],
      ),
    );
  }

  Stack _strokeText({required String text, required double fontSize}) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w900,
              foreground: Paint()..color = Colors.white),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
