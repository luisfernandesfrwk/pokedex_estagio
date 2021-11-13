import 'package:flutter/material.dart';
import 'package:projeto_estagio/api/poke_api.dart';
import 'package:projeto_estagio/r.dart';
import 'package:projeto_estagio/utils/colors_util.dart';

class LogoSearchBar extends StatelessWidget {
  const LogoSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          width: 165,
          height: 60,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(R.assetsPokemonLogo), fit: BoxFit.fill),
          ),
        ), //arrumar isso aqui depois :)
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(32, 1, 15, 0),
          height: 50,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                )
              ],
              shape: BoxShape.rectangle,
              color: ColorsUtil.textFieldBackground,
              borderRadius: BorderRadius.circular(50.0)),
          child: TextField(
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.text,
            textAlignVertical: TextAlignVertical.top,
            enabled: true,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
              hintText: "Busque por um pokemon",
              border: InputBorder.none,
              suffixIconConstraints: const BoxConstraints.tightFor(
                width: 35,
                height: 35,
              ),
              suffixIcon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  color: ColorsUtil.primaryYellow,
                  child: InkWell(
                    child: Icon(
                      Icons.search,
                      size: 25,
                      color: ColorsUtil.searchIcon,
                    ),
                    onTap: () {
                      PokeApi().getHttp();
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
