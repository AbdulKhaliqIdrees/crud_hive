import 'package:crud_hive/models/textfieldmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReadData extends StatelessWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WatchBoxBuilder(
      box: Hive.box<TextFieldModel>('textFields'),
      builder: (context, contactsBox) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact = contactsBox.getAt(index) as TextFieldModel;

            return ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.rollno.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  /* IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      contactsBox.putAt(
                        index,
                        TextFieldModel('${contact.name}*', contact.rollno + 1),
                      );
                    },
                  ),*/
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      contactsBox.deleteAt(index);
                    },
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
