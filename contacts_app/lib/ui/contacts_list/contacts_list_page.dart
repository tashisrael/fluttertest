import 'package:flutter/material.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts'),),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return const Text('Contacts test', style: TextStyle(fontSize: 30),);
        },
      ),
    );
  }
}