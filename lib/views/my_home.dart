import 'package:crud_hive/models/textfieldmodel.dart';
import 'package:crud_hive/views/read_data.dart';
import 'package:crud_hive/widgets/reuse_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  void create(TextFieldModel textFieldModel) {
    final contactsBox = Hive.box<TextFieldModel>('textFields');
    contactsBox.put(rollno.text, textFieldModel);
  }

  void update(TextFieldModel textFieldModel) {
    final contactsBox = Hive.box<TextFieldModel>('textFields');
    contactsBox.put(rollno.text, textFieldModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("University Record"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ReuseTextfield(name, "Name"),
            ReuseTextfield(rollno, "RollNo"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () async {
                    final newContact =
                        TextFieldModel(name.text, int.parse(rollno.text));
                    create(newContact);
                    name.clear();
                    rollno.clear();
                  },
                  color: Colors.red,
                  child: const Text("Create"),
                ),
                MaterialButton(
                  onPressed: () async {
                    final newContact =
                        TextFieldModel(name.text, int.parse(rollno.text));
                    update(newContact);
                    name.clear();
                    rollno.clear();
                  },
                  color: Colors.yellow,
                  child: const Text("Update"),
                ),
              ],
            ),
            Expanded(
              child: ReadData(),
            ),
          ],
        ),
      ),
    );
  }
}
