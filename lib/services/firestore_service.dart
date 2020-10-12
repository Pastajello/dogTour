import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogtour_admin/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:dogtour_admin/models/pet.dart';

@injectable
class FirestoreService {
  final CollectionReference _profilesCollectionReference =
      Firestore.instance.collection("profiles");

  Future createUser(User user) async {
    await _profilesCollectionReference.document(user.id).setData(user.toJson());
  }

  Future<User> getUserProfile(String uid) async {
    var userProfile = await _profilesCollectionReference.document(uid).get();
    var user = User.fromJson(userProfile.data);
    return user;
  }

  Future addPet(Pet pet) async {
    CollectionReference collection = Firestore.instance.collection('pets');
    await collection.add(pet.toJson());
  }
}
