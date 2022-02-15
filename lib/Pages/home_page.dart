import 'package:flutter/material.dart';
import 'package:hive_demo/Pages/creating_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hive Object'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Route route = MaterialPageRoute(builder: (context) {
                return const CreatingPage();
              });
              Navigator.push(context, route);
            }),
        body: const Center(
          child: Text('Empty'),
        ));
  }
}
