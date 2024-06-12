import 'package:contacts_app/data/contact.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class ContactsListPage extends StatefulWidget {

  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  late List<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    _contacts = List.generate(50, (index) {
      return Contact(
        name: faker.person.firstName(), 
        email: faker.internet.freeEmail(), 
        phoneNumber: faker.randomGenerator.integer(1000000).toString(),
      );
    },);
  }

//build runs when the state changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts'),),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ContactTile(index);
        },
      ),
    );
  }

  
}