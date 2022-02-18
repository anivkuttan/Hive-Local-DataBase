import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Modals/contact.dart';

class EditingPage extends StatefulWidget {
  final int amount;
  final String name;
  final int index;
  const EditingPage({Key? key, required this.amount, required this.name, required this.index})
      : super(key: key);

  @override
  _EditingPageState createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  late Box<Contact> contactBox;
  late final TextEditingController _nameController;
  late final TextEditingController _amountController;
  @override
  void initState() {
    contactBox = Hive.box('ContactBox');
    _nameController = TextEditingController(text: widget.name);
    _amountController = TextEditingController(text: widget.amount.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updete Contact'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildTextField(controller: _nameController, hintText: 'Name'),
          buildTextField(controller: _amountController, hintText: 'Amount'),
          SizedBox(
            width: double.infinity,
            height: 60,
            // save Button
            child: ElevatedButton(
              child: const Text('Update'),
              onPressed: () async {
                String _name = _nameController.text;
                int _amount = int.parse(_amountController.text);
                Contact newContact = Contact(name: _name, amount: _amount);

                contactBox.putAt(widget.index, newContact);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      )),
    );
  }

  buildTextField({controller, hintText}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
