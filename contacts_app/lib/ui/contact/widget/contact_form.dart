import 'package:contacts_app/data/contact.dart';
import 'package:contacts_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactForm extends StatefulWidget {
  final Contact? editedContact;
  final int? editedContactIndex;

  const ContactForm({
    super.key,
    this.editedContact,
    this.editedContactIndex,
  });

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _phoneNumber;

  bool get isEditMode => widget.editedContact != null;

  @override
  void initState() {
    super.initState();
    _name = widget.editedContact?.name ?? '';
    _email = widget.editedContact?.email ?? '';
    _phoneNumber = widget.editedContact?.phoneNumber ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildContactPicture(),
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
            initialValue: _name,
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
            initialValue: _email,
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
            initialValue: _phoneNumber,
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
                Icon(Icons.person, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactPicture() {
    String displayText = _name.isNotEmpty ? _name[0] : '?';
    return CircleAvatar(
      radius: 50,
      child: Text(
        displayText,
        style: TextStyle(fontSize: 40),
      ),
    );
  }

  void _onSaveButtonPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      final newContact = Contact(
        name: _name,
        email: _email,
        phoneNumber: _phoneNumber,
        isFavorite: widget.editedContact?.isFavorite ?? false,
      );

      if (isEditMode) {
        ScopedModel.of<ContactsModel>(context).updateContact(newContact, widget.editedContactIndex!);
      } else {
        ScopedModel.of<ContactsModel>(context).addContact(newContact);
      }

      Navigator.of(context).pop();
    }
  }
}
