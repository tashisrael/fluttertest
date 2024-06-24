import 'package:contacts_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.contactIndex,
    //required this.onFavoritePressed,
  });

  final int contactIndex;
  //final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContactsModel>(
      builder: (context, child, model) {
        final displayedContact = model.contacts[contactIndex];
        return ListTile(
        title: Text(displayedContact.name),
        subtitle: Text(displayedContact.email),
        trailing: IconButton(
          icon: Icon(
            displayedContact.isFavorite ? Icons.star : Icons.star_border,
            color: displayedContact.isFavorite ? Colors.amber : Colors.grey,
          ),
          onPressed: () {
            model.changeFavoriteStatus(contactIndex);
          },
        ),
      );
      } 
    );
  }
}
