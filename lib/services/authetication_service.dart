import 'package:injectable/injectable.dart';

@injectable
class AutheticationService {
  Future<bool> doSomething() async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}
