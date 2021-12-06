// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/model/typedetailed_model.dart';
import 'package:projeto_estagio/r.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:projeto_estagio/utils/png_util.dart';
import 'package:projeto_estagio/widgets/type_widget.dart';

class TabTipos extends StatelessWidget {
  const TabTipos(
      {Key? key,
      required this.type,
      required this.color,
      required this.typeDetailed})
      : super(key: key);

  final List<Type> type;
  final Color color;
  final List<TypeDetailed?> typeDetailed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsUtil.appBackground,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 16,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 14),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
                itemCount: type.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                    child: TypeWidget(
                      typeName: type[index].type.name,
                      width: 39,
                      height: 119,
                      fontSize: 18,
                    ),
                  );
                }),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  // color: Colors.white,
                  width: 191.9,
                  height: 371,
                  child: Column(
                    children: [
                      _tileAtkDef(
                        Colors.white,
                        Colors.white,
                        'Ataque',
                        R.assetsSwords,
                      ),
                      _buildList('Dobro do dano em',
                          typeDetailed[0]?.damageRelations?.doubleDamageTo),
                      _buildList('Metade do danoem',
                          typeDetailed[0]?.damageRelations?.halfDamageTo),
                      _buildList('Nenhum danoem',
                          typeDetailed[0]?.damageRelations?.noDamageTo)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  color: ColorsUtil.electricType,
                  alignment: Alignment.center,
                  height: 343,
                  width: 0.2,
                ),
                Container(
                  // color: Colors.black,
                  width: 191.9,
                  height: 371,
                  child: Column(
                    children: [
                      _tileAtkDef(
                        ColorsUtil.appBackground,
                        Colors.black,
                        'Defesa',
                        R.assetsDeffstat,
                      ),
                      _buildList('Dobro do dano de',
                          typeDetailed[0]?.damageRelations?.doubleDamageFrom),
                      _buildList('Metade do dano de',
                          typeDetailed[0]?.damageRelations?.doubleDamageFrom),
                      _buildList('Nenhum dano de',
                          typeDetailed[0]?.damageRelations?.noDamageFrom)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildList(String texto, List<Generation>? typeDetailed) {
    return Container(
      margin: EdgeInsets.only(top: 31),
      height: 56,
      width: 150,
      child: Column(
        children: [
          Text(
            'Dobro de dano',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14),
          ),
          SizedBox(
            height: 7,
          ),
          SizedBox(
            height: 34,
            child: ListView.builder(
              itemExtent: 70,
              scrollDirection: Axis.horizontal,
              itemCount: (typeDetailed!.length > 1) ? typeDetailed.length : 1,
              itemBuilder: (context, index) {
                return PngTypeUtil.getPngType(
                    name: (typeDetailed.length > 1)
                        ? typeDetailed[index].name.toString()
                        : 'warning');
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _tileAtkDef(
      Color backgroundImage, Color textColor, String text, String image) {
    return Container(
      padding: EdgeInsets.all(2),
      width: 130,
      height: 33,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    color: backgroundImage,
                    borderRadius: BorderRadius.circular(100)),
              ),
              Positioned(
                left: 4,
                child: Image.asset(
                  image,
                  width: 20,
                ),
              )
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
