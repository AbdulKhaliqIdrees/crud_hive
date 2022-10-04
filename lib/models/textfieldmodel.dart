import 'package:hive/hive.dart';

part 'textfieldmodel.g.dart';

@HiveType(typeId: 0) // This is Model Class Type ID
class TextFieldModel {
  @HiveField(0) //This is Field Index
  late String name;
  @HiveField(1) //This is Field Index
  late String rollno;
  @HiveField(2) //This is Field Index
  late String degree;
  @HiveField(3) //This is Field Index
  late String section;

  void delete() {}
}
