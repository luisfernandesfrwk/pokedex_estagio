// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:projeto_estagio/utils/func_util.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({Key? key, required this.typeName}) : super(key: key);

  final String typeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      height: 21,
      width: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(0, 1.5),
          )
        ],
      ),
      child: Text(
        FuncUtil.capitalize(typeName),
        style: TextStyle(
            color: ColorsUtil.getColorByType(type: typeName),
            fontSize: 10,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
