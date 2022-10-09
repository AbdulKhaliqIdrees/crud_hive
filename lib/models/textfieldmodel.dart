import 'package:hive/hive.dart';

part 'textfieldmodel.g.dart';

@HiveType(typeId: 0) // This is Model Class Type ID
class TextFieldModel {
  @HiveField(0) //This is Field Index
  final String name;
  @HiveField(1) //This is Field Index
  final int rollno;

  TextFieldModel(this.name, this.rollno);
}
