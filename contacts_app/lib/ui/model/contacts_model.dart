import 'package:contacts_app/data/contact.dart';
import 'package:faker/faker.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactsModel extends Model {
  //underscore acts like a private access modifier
  final List<Contact> _contacts = List.generate(50, (index) {
      return Contact(
        name: faker.person.firstName(), 
        email: faker.internet.freeEmail(), 
        phoneNumber: faker.randomGenerator.integer(1000000).toString(),
      );
    },);
  
  List<Contact> get contacts => _contacts;

  //List<Contact> get contacts {return _contacts};
}