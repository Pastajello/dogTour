import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:dogtour_admin/services/user_service.dart';
import 'package:dogtour_admin/app/locator.dart';

@injectable
class AutheticationService {
  final UserService _userService = locator<UserService>();

  void signOut() {
    FirebaseAuth.instance.signOut();
    _userService.removeUser();
  }

  Future<AuthResult> signInWithEmail(String email, String password) async {
    final authResult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return authResult;
  }

  Future<AuthResult> signUp(String email, String password) async {
    final authResult = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return authResult;
  }

  Future<AuthResult> signInAnonymously() async {
    final authResult = await FirebaseAuth.instance.signInAnonymously();
    return authResult;
  }
}
