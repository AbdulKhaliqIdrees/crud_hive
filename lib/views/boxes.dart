import 'package:crud_hive/models/textfieldmodel.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<TextFieldModel> getUsers() => Hive.box('textfields');
}
