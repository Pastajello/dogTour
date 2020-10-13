import 'dart:io';
import 'dart:typed_data';

import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/models/pet.dart';
import 'package:dogtour_admin/models/reserved_spot.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:path/path.dart' as Path;
import 'package:dogtour_admin/services/firestore_service.dart';

class AddPetViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  PickedFile image;
  List<Asset> images;
  bool uploading = false;
  String petName;
  String petDescription;
  String petWeight;
  String petAge;
  String petColor;
  String petRace;

  Future<void> init(BuildContext context) async {}

  Future chooseFile() async {
    ImagePicker picker = ImagePicker();
    var file = await picker.getImage(source: ImageSource.gallery);
    image = file;
    notifyListeners();
  }

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('pets/${Path.basename(image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(File(image.path));
    await uploadTask.onComplete;
    var profilePicUrl = await storageReference.getDownloadURL();
    return profilePicUrl;
  }

  Future saveImage(Asset asset) async {
    ByteData byteData = await asset.getByteData();
    List<int> imageData = byteData.buffer.asUint8List();
    StorageReference ref = FirebaseStorage().ref().child('pets/${asset.name}');
    StorageUploadTask uploadTask = ref.putData(imageData);
    var snapshot = (await uploadTask.onComplete);
    return await snapshot.ref.getDownloadURL();
  }

  Future addPet() async {
    try {
      uploading = true;
      notifyListeners();
      var profilePicUrl = "";
      if (image != null) profilePicUrl = await uploadFile();
      var pics = List<String>();
      if (images != null)
        for (var pic in images) {
          var img = await saveImage(pic);
          pics.add(img);
        }
      var pet = Pet(
          name: petName,
          description: petDescription,
          profilePicUrl: profilePicUrl,
          picsUrl: pics,
          age: double.tryParse(petAge),
          color: petColor,
          race: petRace,
          weight: double.tryParse(petWeight),
          tags: ["piesel", "brazowy"]);
      var petDocRef = await _firestoreService.addPet(pet);
      pet.id = petDocRef.documentID;
      pet.calendar = await _firestoreService.createPetCalendar(pet.id);

      notifyListeners();

      _navigationservice.back();
    } catch (e) {
      print(e.toString());
    }
    uploading = false;
    notifyListeners();
  }

  Future<void> selectPetPictures() async {
    images = await MultiImagePicker.pickImages(
      maxImages: 3,
      enableCamera: true,
    );
    notifyListeners();
  }
}
