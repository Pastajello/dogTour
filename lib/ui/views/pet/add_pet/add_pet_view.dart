import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_pet_view_model.dart';

class AddPetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPetViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(),
            body: Container(
                color: Colors.white,
                child: Column(children: [
                  FlatButton(
                    child: Text("pick file"),
                    onPressed: model.chooseFile,
                  ),
                  Image.file(File(model.image.path)),
                  FlatButton(
                    child: Text("upload file"),
                    onPressed: model.uploadFile,
                  ),
                  Image.network(model.uploadedFileURL),
                  FlatButton(
                    child: Text("add doggo"),
                    onPressed: model.addSomeAnimal,
                  ),
                ]))),
        onModelReady: (model) async {
          await model.init(context);
        },
        viewModelBuilder: () => AddPetViewModel());
  }
}
