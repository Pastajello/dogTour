import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogtour_admin/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:dogtour_admin/models/pet.dart';
import 'package:dogtour_admin/models/calendar.dart';
import 'package:dogtour_admin/models/reserved_spot.dart';

@injectable
class FirestoreService {
  final CollectionReference _profilesCollectionReference =
      Firestore.instance.collection("profiles");
  final CollectionReference _petCollectionReference =
      Firestore.instance.collection('pets');
  final CollectionReference _calendarsCollectionReference =
      Firestore.instance.collection('calendars');

  Future createUser(User user) async {
    await _profilesCollectionReference.document(user.id).setData(user.toJson());
  }

  Future<User> getUserProfile(String uid) async {
    var userProfile = await _profilesCollectionReference.document(uid).get();
    var user = User.fromJson(userProfile.data);
    return user;
  }

  Future<DocumentReference> addPet(Pet pet) async {
    return await _petCollectionReference.add(pet.toJson());
  }

  Future deletePet(Pet pet) async {
    return await _petCollectionReference.document(pet.id).delete();
  }

  Future createPetCalendar(String id) async {
    await _calendarsCollectionReference
        .document(id)
        .setData(Calendar(isBlocked: false, petId: id).toJson());
  }

  Future addSpotToPetCalendar(Pet pet, ReservedSpot spot) async {
    await _calendarsCollectionReference
        .document(pet.id)
        .collection("spots")
        .add(spot.toJson());
  }

  Future<List<ReservedSpot>> getReservedSpots(String petId) async {
    var spots = (await _calendarsCollectionReference
            .document(petId)
            .collection("spots")
            .getDocuments())
        .documents
        .map((e) {
      try {
        var spot = ReservedSpot.fromJson(e.data);
        return spot;
      } catch (e) {
        return null;
      }
    }).toList();
    return spots;
  }

  Future<List<Pet>> getPets() async {
    var pets = (await _petCollectionReference.getDocuments())
        .documents
        .where((element) => element.data["name"] != "")
        .map((e) {
      try {
        var pet = Pet.fromJson(e.data);
        pet.id = e.documentID;
        return pet;
      } catch (e) {
        return null;
      }
    }).toList();
    return pets;
  }
}
