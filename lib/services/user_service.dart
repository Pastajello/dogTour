import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'firestore_service.dart';

@singleton
class UserService {
  User _user;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User getUser() {
    return _user;
  }

  void setUser(User user) {
    _user = user;
  }
}
