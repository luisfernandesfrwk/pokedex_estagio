// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:projeto_estagio/model/details_model.dart';

class TabHabilidades extends StatelessWidget {
  const TabHabilidades({Key? key, required this.abilities}) : super(key: key);

  final List<Ability>? abilities;

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
      itemCount: abilities!.length,
      separatorBuilder: (context, index) => Divider(
        color: ColorsUtil.electricType,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              abilities![index].ability.name,
              style: TextStyle(color: ColorsUtil.electricType, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'This Pokémon cannot be asleep.\nThis causes rest to fail altogether.  If a Pokémon is asleep and acquires this ability, it will immediately wake up; this includes when regaining a lost ability upon leaving battle.\nThis ability functions identically to insomnia in battle.\nOverworld: If the lead Pokémon has this ability, higher-levelled Pokémon have their encounter rate increased.',
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
