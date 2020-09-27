import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/models/pet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:path/path.dart' as Path;

class AddPetViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  PickedFile image;
  String uploadedFileURL;

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
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      uploadedFileURL = fileURL;
      notifyListeners();
    });
  }

  Future addSomeAnimal() async {
    try {
      await addAnimal(Pet(
          name: "piesel",
          description: "zwykly piesel, ma 4 nogi",
          profilePicUrl: uploadedFileURL,
          tags: ["piesel", "brazowy"]));
      notifyListeners();
      print('udalo sie');
    } catch (e) {
      print(e.toString());
    }
  }

  Future addAnimal(Pet animal) async {
    CollectionReference collection = Firestore.instance.collection('pets');

    await collection.add(animal.toJson());
  }
}
