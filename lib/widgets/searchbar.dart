import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(32, 0, 15, 0),
      alignment: Alignment.center,
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
          color: HexColor('#262626'),
          borderRadius: BorderRadius.circular(50.0)),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        enabled: true,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
          hintText: hint,
          border: InputBorder.none,
          suffixIconConstraints: const BoxConstraints.tightFor(
            width: 35,
            height: 35,
          ),
          suffixIcon: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Material(
              color: HexColor('#FFCC00'),
              child: InkWell(
                child: Icon(
                  Icons.search,
                  size: 25,
                  color: HexColor('#0073BC'),
                ),
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
