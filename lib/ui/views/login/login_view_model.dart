import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/services/authetication_service.dart';
import 'package:dogtour_admin/services/firestore_service.dart';
import 'package:dogtour_admin/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final AutheticationService _autheticationService =
      locator<AutheticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final UserService _userService = locator<UserService>();

  String email;
  String password;

  Future signIn() async {
    try {
      var authResult =
          await _autheticationService.signInWithEmail(email, password);
      var user = await _firestoreService.getUserProfile(authResult.user.uid);
      _userService.setUser(user);
      _navigationservice.back();
    } catch (e) {
      print(e.toString());
    }
  }
}
