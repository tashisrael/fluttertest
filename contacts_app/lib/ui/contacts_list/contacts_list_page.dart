import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({super.key});


  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts'),),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return Text(faker.animal.name(), 
          style: const TextStyle(fontSize: 30),);
        },
      ),
    );
  }
}