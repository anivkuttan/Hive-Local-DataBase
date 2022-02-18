import 'package:flutter/material.dart';
import 'package:hive_demo/Pages/creating_page.dart';
import 'package:hive_demo/Pages/edit_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Modals/contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Box<Contact> contactBox;
  List<Contact> item = [];
  @override
  void initState() {
    contactBox = Hive.box<Contact>('ContactBox');
    super.initState();
  }

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
      body: ValueListenableBuilder(
          valueListenable: contactBox.listenable(),
          builder: (context, _contactBox, child) {
            var boxLength = contactBox.keys.length;
            return ListView.builder(
              itemCount: boxLength,
              itemBuilder: (context, i) {
                var box = contactBox.getAt(i) as Contact;
                return ListTile(
                  title: Text(box.name),
                  subtitle: Text('${box.amount}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Route route = MaterialPageRoute(builder: (context) {
                            return EditingPage(
                              index: i,
                              name: box.name,
                              amount: box.amount,
                            );
                          });
                          Navigator.of(context).push(route);
                        },
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          contactBox.deleteAt(i);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
