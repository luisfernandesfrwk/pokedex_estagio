import 'package:flutter/material.dart';
import 'package:pokedex_estagio/utils/colors_util.dart';
import 'package:pokedex_estagio/utils/func_util.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget(
      {Key? key,
      required this.typeName,
      required this.height,
      required this.width,
      required this.fontSize})
      : super(key: key);

  final String typeName;
  final double height;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      height: width,
      width: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: const Offset(0, 1.5),
          )
        ],
      ),
      child: Text(
        FuncUtil.capitalize(typeName),
        style: TextStyle(
            color: ColorsUtil.getColorByType(type: typeName),
            fontSize: fontSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
