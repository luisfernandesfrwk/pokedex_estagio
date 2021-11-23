// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:projeto_estagio/controller/poke_store.dart';
import 'package:projeto_estagio/controller/pokelist_store.dart';
import 'package:projeto_estagio/r.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchHeader extends StatefulWidget {
  SearchHeader(
      {Key? key,
      required this.controller,
      required this.onTap,
      required this.onChanged,
      required this.isChanged})
      : super(key: key);

  final TextEditingController controller;
  final VoidCallback onTap;
  final Function(String) onChanged;
  final bool isChanged;

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
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
        Observer(
          builder: (BuildContext context) {
            return _textField();
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Container _textField() {
    return (widget.isChanged == false)
        ? Container(
            padding: const EdgeInsets.fromLTRB(32, 1, 15, 0),
            height: 50,
            width: 300,
            margin: EdgeInsets.only(right: 60),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 0.6,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                )
              ],
              shape: BoxShape.rectangle,
              color: ColorsUtil.textFieldBackground,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
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
                      onTap: widget.onTap,
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.fromLTRB(32, 1, 15, 0),
            height: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 0.6,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                )
              ],
              shape: BoxShape.rectangle,
              color: ColorsUtil.textFieldBackground,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
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
                      onTap: widget.onTap,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
