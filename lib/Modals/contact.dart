import 'package:hive/hive.dart';
part 'contact.g.dart';
@HiveType(typeId: 1)
class Contact extends HiveObject{
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int amount;
  Contact({required this.name, required this.amount});
}
