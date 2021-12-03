// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/r.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:projeto_estagio/utils/svg_util.dart';
import 'package:projeto_estagio/widgets/type_widget.dart';

class TabTipos extends StatelessWidget {
  const TabTipos({Key? key, required this.type}) : super(key: key);

  final List<Type> type;

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
                        ColorsUtil.electricType,
                        Colors.white,
                        'Ataque',
                        R.assetsSwords,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 31),
                        color: Colors.red,
                        height: 56,
                        width: 150,
                        child: Text('Dobro de dano'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 31),
                        color: Colors.pink,
                        height: 56,
                        width: 150,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 31),
                        color: Colors.blue,
                        height: 56,
                        width: 150,
                      ),
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
                        ColorsUtil.electricType,
                        ColorsUtil.appBackground,
                        'Defesa',
                        R.assetsDeffstat,
                      )
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

  Container _tileAtkDef(Color backgroundImage, Color backgroundColor,
      Color textColor, String text, String image) {
    return Container(
      padding: EdgeInsets.all(2),
      width: 130,
      height: 33,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(100)),
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
