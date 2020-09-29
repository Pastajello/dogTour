import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/models/pet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:path/path.dart' as Path;

class AddPetViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  PickedFile image;
  String uploadedFileURL;
  bool doggoAdded = false;

  String petName;

  String petDescription;

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
        .child('pets/${Path.basename(image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(File(image.path));
    await uploadTask.onComplete;
    var profilePicUrl = await storageReference.getDownloadURL();
    return profilePicUrl;
  }

  Future addSomeAnimal() async {
    try {
      var profilePicUrl = await uploadFile();
      await addAnimal(Pet(
          name: petName,
          description: petDescription,
          profilePicUrl: profilePicUrl,
          tags: ["piesel", "brazowy"]));
      notifyListeners();
      _navigationservice.back();
    } catch (e) {
      print(e.toString());
    }
  }

  Future addAnimal(Pet animal) async {
    CollectionReference collection = Firestore.instance.collection('pets');

    await collection.add(animal.toJson());
  }

  Future<void> selectPetPictures() async {
    var resultList = await MultiImagePicker.pickImages(
      maxImages: 300,
      enableCamera: true,
    );
    int i = 5;
  }
}
