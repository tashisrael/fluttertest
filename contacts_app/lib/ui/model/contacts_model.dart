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
  //OR List<Contact> get contacts {return _contacts;}

  void addContact(Contact contact) {
    print(_contacts.length);
    _contacts.add(contact);
    print(_contacts.length);
    notifyListeners();
  }

  void changeFavoriteStatus(int index){
    _contacts[index].isFavorite = !_contacts[index].isFavorite;
      _sortContacts(); 
      notifyListeners();
}

  void _sortContacts() {
    _contacts.sort((a, b) {
      int comparisonResult;

      comparisonResult = _compareBasedOnFavoriteStatus(a, b);

      if (comparisonResult == 0) {
        comparisonResult = _compareAlphabetically(a, b);
      }

      return comparisonResult;
    }); 
  }

  int _compareBasedOnFavoriteStatus(Contact a, Contact b) {
    if (a.isFavorite) {
      //contactOne wil be before contactTwo
      return -1;
    }else if (b.isFavorite) {
      //contactOne wil be after contactTwo
      return 1;
    }else {
      return 0;
    }
  }

  int _compareAlphabetically(Contact a, Contact b) {
    return a.name.compareTo(b.name);
  }
}