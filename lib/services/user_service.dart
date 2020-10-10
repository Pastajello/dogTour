import 'package:dogtour_admin/models/user.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserService {
  User _user;

  User getUser() {
    return _user;
  }

  void removeUser() {
    _user = null;
  }

  void setUser(User user) {
    _user = user;
  }
}
