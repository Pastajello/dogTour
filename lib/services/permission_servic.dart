import 'package:dogtour_admin/app/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'user_service.dart';

enum UserPermission {
  createModerator,
  addPet,
  deletePet,
  editPet,
  walkPet,
  adoptPet,
  sponsorPet,
}

@injectable
class PermissionService {
  final UserService _userService = locator<UserService>();

  var userPermissions = [
    UserPermission.walkPet,
    UserPermission.adoptPet,
    UserPermission.sponsorPet
  ];
  var moderatorPermissions = [
    UserPermission.addPet,
    UserPermission.deletePet,
    UserPermission.editPet
  ];

  bool canUser(UserPermission permission) {
    var user = _userService.getUser();

    if (user.userRole == "admin") {
      return true;
    } else if (user.userRole == "user") {
      return userPermissions.contains(permission);
    } else if (user.userRole == "moderator") {
      return moderatorPermissions.contains(permission);
    }
    return false;
  }
}
