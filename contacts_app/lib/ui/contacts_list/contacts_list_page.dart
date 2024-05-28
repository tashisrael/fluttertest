import 'package:flutter/material.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts'),),
      body: const Column(children: [
        Text('Contact test', style: TextStyle(fontSize: 20),),
      ],),
    );
  }
}