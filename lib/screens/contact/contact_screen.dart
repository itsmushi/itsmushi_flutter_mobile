import 'package:flutter/material.dart';
import 'package:itsmushi/main.dart';
import 'package:itsmushi/models/contact.dart';
import 'package:itsmushi/utils/service/local/database_helper.dart';

class ContactScreen extends StatelessWidget {
  static String route_name = "contact_screen";

  DatabaseHelper databaseHelper = new DatabaseHelper();

  // ignore: non_constant_identifier_names
  bool first_time = true;

  @override
  Widget build(BuildContext context) {
    if (first_time) {
      print("oooobject");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.app_name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("the contact"),
          ElevatedButton(
            onPressed: () {
              databaseHelper.database.whenComplete(() => {
                    print("is_initializied"),
                    first_time = false,
                    // contact = ContactModel(id: 1, name: "jame", number: "0734"),
                    databaseHelper
                        .insertContact(
                            ContactModel( name: "jame", number: "0734"))
                        .whenComplete(() => {
                              print("contact inserted sucessfully"),  
                              print("doneeee"),
                            }),
                  });
            },
            child: Text("Add Contact"),
          ),
        ],
      ),
    );
  }
}
