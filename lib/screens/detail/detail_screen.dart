// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/screens/detail/widgets/tab_habilidades.dart';
import 'package:projeto_estagio/screens/detail/widgets/tab_movimentos.dart';
import 'package:projeto_estagio/screens/detail/widgets/tab_tipos.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';
import 'package:projeto_estagio/widgets/type_widget.dart';

import '../../r.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {Key? key,
      required this.pokemon,
      required this.image,
      required this.typeName})
      : super(key: key);

  final Details? pokemon;
  final String image;
  final String typeName;

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
        title: FuncUtil.strokeText(text: widget.pokemon!.name!, fontSize: 26),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
          iconSize: 17,
        ),
      ),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      color: ColorsUtil.electricType,
      // padding: const EdgeInsets.only(top: 300),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 138,
                height: 308.444,
                padding: EdgeInsets.only(top: 97),
                // ignore: prefer_const_literals_to_create_immutables
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TypeWidget(
                      typeName: widget.typeName,
                      width: 39,
                      height: 119,
                      fontSize: 18,
                    ),
                    SizedBox(
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
                padding: EdgeInsets.only(top: 60),
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: TabBar(
              padding: EdgeInsets.only(top: 10),

              indicatorWeight: 3.2,
              indicatorPadding: EdgeInsets.fromLTRB(30, 0, 30, 10),
              indicatorColor: ColorsUtil.primaryYellow,
              unselectedLabelColor: ColorsUtil.primaryYellow,
              labelColor: ColorsUtil.primaryYellow,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                Tab(text: 'Habilidades'),
                Tab(text: 'Tipos'),
                Tab(text: 'Movimentos')
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Expanded(
            child: TabBarView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TabHabilidades(abilities: widget.pokemon!.abilities),
                TabTipos(type: widget.pokemon!.types),
                TabMovimentos(moves: widget.pokemon!.moves),
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
      margin: EdgeInsets.only(bottom: 5),
      height: 28,
      width: 75,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: ColorsUtil.getColorByHex('EBD479'),
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
              ? FuncUtil.strokeText(text: stat, fontSize: 15)
              : FuncUtil.strokeText(text: stat, fontSize: 18),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
