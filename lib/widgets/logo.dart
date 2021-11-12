import 'package:flutter/material.dart';
import 'package:projeto_estagio/r.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(R.assetsPokemonLogo), fit: BoxFit.fill),
      ),
    );
  }
}
