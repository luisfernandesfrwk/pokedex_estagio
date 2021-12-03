import 'package:flutter/material.dart';
import 'package:projeto_estagio/model/details_model.dart';
import 'package:projeto_estagio/utils/colors_util.dart';

class TabMovimentos extends StatelessWidget {
  const TabMovimentos({Key? key, required this.moves}) : super(key: key);

  final List<Move>? moves;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      color: ColorsUtil.appBackground,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 144 / 47,
            mainAxisSpacing: 25,
            crossAxisSpacing: 39,
            crossAxisCount: 2,
          ),
          itemCount: moves!.length,
          itemBuilder: ((context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorsUtil.electricType,
              ),
              child: Center(
                  child: Text(
                moves![index].move.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
            );
          })),
    );
  }
}
