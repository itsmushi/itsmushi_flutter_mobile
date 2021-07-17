import 'package:flutter/material.dart';
import 'package:itsmushi/models/contact.dart';

class Contacts with ChangeNotifier {
  //initiator
  List<ContactModel> _contacts;

  //selector
  List<ContactModel> get contacts => _contacts;

  //reducer
  Future getContacts() async{
    _contacts=await Co
  }

}
