import 'package:crud_hive/models/textfieldmodel.dart';
import 'package:crud_hive/views/boxes.dart';
import 'package:crud_hive/widgets/reuse_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController degree = TextEditingController();
  TextEditingController section = TextEditingController();
  @override
  void dispose() {
    Hive.close(); // Closing All Boxes

    //Hive.box('textfields').close();// Closing Selected Box

    super.dispose();
  }

  Future<void> create(
      String name, String rollno, String degree, String section) async {
    final user = TextFieldModel()
      ..name = name
      ..rollno = rollno
      ..degree = degree
      ..section = section;

    final box = Boxes.getUsers();
    //Key Auto Increment
    box.add(user).then((value) => clearPage());
  }

  Future<void> update(TextFieldModel textfieldmodel) async {
    name.text = textfieldmodel.name;
    rollno.text = textfieldmodel.rollno;
    degree.text = textfieldmodel.degree;
    section.text = textfieldmodel.section;

    delete(textfieldmodel);

    // if you want to do with key you can use that too.

    //box.put("myKey", user);
    //final myBox = Boxes.getUsers();
    //final myUser = myBox.get("myKey");
    //myBox.values; // Access All Values
    //myBox.keys; // Access By Key
  }

  Future<void> delete(TextFieldModel textfieldmodel) async {
    textfieldmodel.delete();
  }

  clearPage() {
    name.text = '';
    rollno.text = '';
    degree.text = '';
    section.text = '';
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
            ReuseTextfield(degree, "Degree"),
            ReuseTextfield(section, "Section"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    create(name.text, rollno.text, degree.text, section.text);
                    name.clear();
                    rollno.clear();
                    degree.clear();
                    section.clear();
                  },
                  color: Colors.red,
                  child: const Text("Create"),
                ),
                MaterialButton(
                  onPressed: () {
                    //update(textfieldmodel);
                    name.clear();
                    rollno.clear();
                    degree.clear();
                    section.clear();
                  },
                  color: Colors.yellow,
                  child: const Text("Update"),
                ),
                MaterialButton(
                  onPressed: () {
                    //delete(textfieldmodel);
                    name.clear();
                    rollno.clear();
                    degree.clear();
                    section.clear();
                  },
                  color: Colors.orange,
                  child: const Text("Delete"),
                ),
              ],
            ),
            /*Expanded(
                child: Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(ali[index].name),
                      Text(ali[index].rollno),
                      Text(ali[index].degree),
                      Text(ali[index].section),
                    ],
                  );
                },
                separatorBuilder: ((context, index) {
                  return Divider();
                }),
                itemCount: ali.length,
              ),
            )),*/
          ],
        ),
      ),
    );
  }
}
