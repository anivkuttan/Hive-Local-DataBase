import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Modals/contact.dart';

class CreatingPage extends StatefulWidget {
  const CreatingPage({Key? key}) : super(key: key);

  @override
  _CreatingPageState createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingPage> {
  late Box<Contact> contactBox;
  late final TextEditingController _nameController;
  late final TextEditingController _amountController;
  @override
  void initState() {
    contactBox = Hive.box('ContactBox');
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
          buildTextField(controller: _nameController, hintText: 'Name',keyType:TextInputType.text ),
          buildTextField(controller: _amountController, hintText: 'Amount',keyType: TextInputType.number),
          SizedBox(
            width: double.infinity,
            height: 60,
            // save Button
            child: ElevatedButton(
              child: const Text('Add'),
              onPressed: () async {
                String _name = _nameController.text;
                int _amount = int.parse(_amountController.text);
                Contact newContact = Contact(name: _name, amount: _amount);
                contactBox.add(newContact);
                Navigator.pop(context);
               
              },
            ),
          ),
        ],
      )),
    );
  }

  buildTextField({controller, hintText,keyType}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        keyboardType:keyType ,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
