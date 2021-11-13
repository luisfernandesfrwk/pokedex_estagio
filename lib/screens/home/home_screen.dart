import 'package:flutter/material.dart';
import 'package:projeto_estagio/screens/home/logo_searchbar_widget.dart';

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoSearchBar(),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Card(
                            margin: EdgeInsets.all(16.0),
                            child: Container(
                              height: 107,
                              width: 151,
                              child: Text('sla'),
                            )),
                        Card(
                            child: Container(
                          height: 107,
                          width: 151,
                          child: Text('sla'),
                        )),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
