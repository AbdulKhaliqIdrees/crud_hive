import 'package:crud_hive/models/textfieldmodel.dart';
import 'package:crud_hive/views/my_home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TextFieldModelAdapter());
  await Hive.openBox<TextFieldModel>('textfields');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hive_Crud",
      home: MyHome(),
    );
  }
}
