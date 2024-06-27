import 'package:contacts_app/data/contact.dart';
import 'package:contacts_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onSaved: (value) => _name = value ?? '',
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            onSaved: (value) => _email = value ?? '',
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Phone Number';
              }
              if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
                return 'Please enter a valid Phone Number';
              }
              return null;
            },
            onSaved: (value) => _phoneNumber = value ?? '',
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Change button color here
              foregroundColor: Colors.white, // Change text color here
            ),
            onPressed: _onSaveButtonPressed,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Save Contact'),
                Icon(Icons.person, size: 18,),
              ]
            )
          ),
        ],
      ),
    );
  }

  void _onSaveButtonPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      final newContact = Contact(name: _name, email: _email, phoneNumber: _phoneNumber);
      ScopedModel.of<ContactsModel>(context).addContact(newContact);
      //print('Name: $_name, Email: $_email, Phone Number: $_phoneNumber');
      Navigator.of(context).pop();
    }
  }
}