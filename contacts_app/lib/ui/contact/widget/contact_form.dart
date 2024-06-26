import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  //const ContactForm({super.key});

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
          TextFormField(
            onSaved: (value) => _name = value ?? '',
            decoration: const InputDecoration(
              labelText: 'Name'
            ),
          ),
          TextFormField(
            onSaved: (value) => _email = value ?? '',
            decoration: const InputDecoration(
              labelText: 'Email'
            ),
          ),
          TextFormField(
            onSaved: (value) => _phoneNumber = value ?? '',
            decoration: const InputDecoration(
              labelText: 'Phone Number'
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _formKey.currentState?.save();
              print('Name: $_name, Email: $_email, Phone Number: $_phoneNumber');
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}