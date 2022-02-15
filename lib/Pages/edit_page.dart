import 'package:flutter/material.dart';

class CreatingPage extends StatefulWidget {
  const CreatingPage({Key? key}) : super(key: key);

  @override
  _CreatingPageState createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Contact'),
      ),
    );
  }
}
