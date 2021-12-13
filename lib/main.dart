import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_estagio/screens/home/home_screen.dart';
import 'package:pokedex_estagio/utils/colors_util.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex app',
      theme: ThemeData(
        primaryColor: ColorsUtil.appBackground,
      ),
      home: const HomeScreen(),
    );
  }
}
