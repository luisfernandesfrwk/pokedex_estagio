import 'package:flutter/material.dart';
import 'package:projeto_estagio/widgets/logo.dart';
import 'package:projeto_estagio/widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              const Logo().build(context),
              const SizedBox(
                height: 20,
              ),
              const SearchBar(
                hint: 'Busque por um pokemon',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
