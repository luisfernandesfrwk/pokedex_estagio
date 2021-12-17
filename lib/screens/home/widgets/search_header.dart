// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projeto_estagio/r.dart';
import 'package:projeto_estagio/utils/colors_util.dart';

class SearchHeader extends StatefulWidget {
  SearchHeader(
      {Key? key,
      required this.isSearchValid,
      required this.controller,
      required this.onTapClear,
      required this.onTapSearch,
      required this.onChanged,
      required this.isEmpty})
      : super(key: key);

  final bool isSearchValid;
  final TextEditingController controller;
  final VoidCallback onTapClear;
  final VoidCallback onTapSearch;
  final Function(String) onChanged;
  final bool isEmpty;

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  @override
  Widget build(BuildContext context) {
    double iconConstraints = widget.isEmpty ? 0 : 35;
    double iconMargin = widget.isEmpty ? 0 : 3;
    double iconSize = widget.isEmpty ? 0 : 25;
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        InkWell(
          onTap: widget.onTapClear,
          child: Container(
            width: 165,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(R.assetsLogo), fit: BoxFit.fill),
            ),
          ),
        ),
        Row(
          children: [
            _textField(),
            AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: iconConstraints,
                height: iconConstraints,
                margin: EdgeInsets.only(left: iconMargin),
                child: _customIcon(
                  ColorsUtil.textFieldBackground,
                  ColorsUtil.primaryYellow,
                  Icons.backspace,
                  widget.onTapClear,
                  EdgeInsets.only(right: 3),
                  iconSize,
                ))
          ],
        ),
      ],
    );
  }

  AnimatedContainer _textField() {
    double width = widget.isEmpty
        ? (MediaQuery.of(context).size.width - 32)
        : (MediaQuery.of(context).size.width - 70);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.fromLTRB(32, 1, 15, 0),
      height: 50,
      width: width,
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
          suffixIcon: _customIcon(
              ColorsUtil.primaryYellow,
              ColorsUtil.searchIcon,
              Icons.search,
              widget.onTapSearch,
              EdgeInsets.zero,
              24),
        ),
      ),
    );
  }

  ClipRRect _customIcon(
    Color backgroundColor,
    Color iconColor,
    IconData icon,
    VoidCallback onTap,
    EdgeInsets padding,
    double size,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: backgroundColor,
        child: Padding(
          padding: padding,
          child: InkWell(
            child: Icon(
              icon,
              size: size,
              color: iconColor,
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
