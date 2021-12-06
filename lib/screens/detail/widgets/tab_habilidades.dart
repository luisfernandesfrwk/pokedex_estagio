// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_estagio/model/abilities_model.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/utils/func_util.dart';

class TabHabilidades extends StatelessWidget {
  const TabHabilidades({Key? key, required this.abilities, required this.color})
      : super(key: key);

  final List<Abilities?> abilities;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      color: ColorsUtil.appBackground,
      child: Container(
        color: ColorsUtil.appBackground,
        child: _buildListView(),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.separated(
      itemCount: abilities.length,
      separatorBuilder: (context, index) => Divider(
        color: color,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FuncUtil.capitalize(abilities[index]!.name),
              style: TextStyle(color: color, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              abilities[index]!.flavorTextEntries![0].flavorText,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            SizedBox(
              height: 19,
            )
          ],
        );
      },
    );
  }
}
