// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_estagio/r.dart';
import 'package:projeto_estagio/utils/colors_util.dart';

class SearchHeader extends StatefulWidget {
  SearchHeader(
      {Key? key,
      required this.controller,
      required this.onTap,
      required this.onChanged,
      required this.isEmpty})
      : super(key: key);

  final TextEditingController controller;
  final VoidCallback onTap;
  final Function(String) onChanged;
  final bool isEmpty;

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
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(R.assetsPokemonLogo), fit: BoxFit.fill),
          ),
        ),
        _textField(),
      ],
    );
  }

  Container _textField() {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 1, 15, 0),
      height: 50,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 0.6,
            blurRadius: 2,
            offset: Offset(0, 2),
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
              child: Padding(
                padding: (widget.isEmpty == true)
                    ? EdgeInsets.zero
                    : EdgeInsets.only(right: 2),
                child: InkWell(
                  child: Icon(
                    (widget.isEmpty == true) ? Icons.search : Icons.backspace,
                    size: (widget.isEmpty == true) ? 25 : 23,
                    color: ColorsUtil.searchIcon,
                  ),
                  onTap: widget.onTap,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
