import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/models/permission_state.dart';
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

  var guestPermissions = {
    UserPermission.walkPet: PermissionState.login,
    UserPermission.adoptPet: PermissionState.login,
    UserPermission.sponsorPet: PermissionState.login,
  };

  var userPermissions = {
    UserPermission.walkPet: PermissionState.allowed,
    UserPermission.adoptPet: PermissionState.allowed,
    UserPermission.sponsorPet: PermissionState.allowed,
  };

  var moderatorPermissions = {
    UserPermission.addPet: PermissionState.allowed,
    UserPermission.deletePet: PermissionState.allowed,
    UserPermission.editPet: PermissionState.allowed,
  };

  PermissionState canUser(UserPermission permission) {
    var user = _userService.getUser();

    if (user == null)
      return guestPermissions.containsKey(permission)
          ? guestPermissions[permission]
          : PermissionState.forbidden;

    if (user.userRole == "admin") {
      return PermissionState.allowed;
    } else if (user.userRole == "user") {
      return userPermissions.containsKey(permission)
          ? userPermissions[permission]
          : PermissionState.forbidden;
    } else if (user.userRole == "moderator") {
      return moderatorPermissions.containsKey(permission)
          ? moderatorPermissions[permission]
          : PermissionState.forbidden;
    }
    return PermissionState.forbidden;
  }
}
