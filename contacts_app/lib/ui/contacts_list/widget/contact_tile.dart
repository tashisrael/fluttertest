import 'package:contacts_app/data/contact.dart';
import 'package:contacts_app/ui/contact/contact_edit_page.dart';
import 'package:contacts_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    final model = ScopedModel.of<ContactsModel>(context, rebuildOnChange: true);
        final displayedContact = model.contacts[contactIndex];
        return Slidable(
          key: ValueKey(contactIndex),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              model.deleteContact(contactIndex);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contact deleted successfully'),
                ),
              );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
          child: _buildContent(displayedContact, model, context),
        );
      }

  ListTile _buildContent(Contact displayedContact, ContactsModel model, BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          child: Text(
            displayedContact.name[0]
          ),
        ),
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
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => ContactEditPage(editedContact: displayedContact, 
            editedContactIndex: contactIndex),
            ));
        },
        );
  }
}
