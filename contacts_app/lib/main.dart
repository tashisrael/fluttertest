import 'package:contacts_app/ui/contact/contact_create_page.dart';
//import 'package:contacts_app/ui/contacts_list/contacts_list_page.dart';
import 'package:contacts_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  ScopedModel(
      model: ContactsModel(),
      child: MaterialApp(
        title: 'Contacts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Colors.blue,
          ),
        ),
        home: ContactCreatePage(),
      ),
    );
  }
}

