import 'package:flutter/material.dart';

class CreatingPage extends StatefulWidget {
  const CreatingPage({Key? key}) : super(key: key);

  @override
  _CreatingPageState createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _amountController;
  @override
  void initState() {
    _nameController = TextEditingController();
    _amountController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _amountController,
                maxLines: 10,
                decoration: const InputDecoration(
                   hintText: 'Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
