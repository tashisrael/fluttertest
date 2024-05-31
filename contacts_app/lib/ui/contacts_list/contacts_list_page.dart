import 'package:contacts_app/data/contact.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class ContactsListPage extends StatelessWidget {
  final List<Contact> _contacts = List.generate(50, (index) {
    return Contact(
      name: faker.person.firstName(), 
      email: faker.internet.freeEmail(), 
      phoneNumber: faker.randomGenerator.integer(1000000).toString(),);
  },);
 // const ContactsListPage({super.key});
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