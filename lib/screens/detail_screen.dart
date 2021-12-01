// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';
import 'package:projeto_estagio/widgets/type_widget.dart';

import '../r.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: FuncUtil.strokeText(text: 'Electabuzz', fontSize: 22),
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
      color: ColorsUtil.primaryYellow,
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
                      typeName: 'Electric',
                      width: 39,
                      height: 119,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    _statWidget(image: R.assetsHpstat),
                    _statWidget(image: R.assetsAttackstat),
                    _statWidget(image: R.assetsDeffensestat),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 60),
                width: 246,
                height: 308.444,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/125.png',
                ),
              ),
            ],
          ),
          TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.red,
            tabs: [
              Tab(text: 'Habilidades'),
              Tab(text: 'Tipos'),
              Tab(text: 'Movimentos')
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              children: [Text('people'), Text('Person'), Text('Person')],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statWidget({required String image}) {
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
          ),
          FuncUtil.strokeText(text: '65', fontSize: 18),
        ],
      ),
    );
  }
}
