import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogtour_admin/models/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("profiles");

  Future createUser(User user) async {
    await _usersCollectionReference.document(user.id).setData(user.toJson());
  }
}
