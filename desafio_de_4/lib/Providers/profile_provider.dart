
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier
{
  String _name = "John Doe";
  String _role = "Student";
  String _email = "john_doe@outlook.com";

  String get name => _name;
  String get role => _role;
  String get email => _email;

  void updateData(String newName, String newRole, String newEmail)
  {
    _name = newName;
    _role = newRole;
    _email = newEmail;
    notifyListeners();
  }
}