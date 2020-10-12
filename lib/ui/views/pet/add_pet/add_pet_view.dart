import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:stacked/stacked.dart';

import 'add_pet_view_model.dart';

class AddPetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPetViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
                title: Text(
              "Add a pet",
            )),
            body: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    if (model.image?.path != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(75.0),
                        child: Image.file(
                          File(model.image.path),
                          height: 150.0,
                          width: 100.0,
                        ),
                      )
                    else
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        width: 150,
                        height: 150,
                      ),
                    FlatButton(
                      child: Text("Pick profile picture"),
                      onPressed: model.chooseFile,
                    ),
                    TextField(
                      onChanged: (value) => model.petName = value,
                      decoration: InputDecoration(hintText: "Pet name"),
                    ),
                    TextField(
                      onChanged: (value) => model.petRace = value,
                      decoration: InputDecoration(hintText: "Pet race"),
                    ),
                    TextField(
                      maxLines: null,
                      onChanged: (value) => model.petDescription = value,
                      decoration: InputDecoration(hintText: "Some description"),
                    ),
                    TextField(
                      onChanged: (value) => model.petWeight = value,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Pet weight"),
                    ),
                    TextField(
                      onChanged: (value) => model.petColor = value,
                      decoration: InputDecoration(hintText: "Pet color"),
                    ),
                    TextField(
                      onChanged: (value) => model.petAge = value,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Pet age"),
                    ),
                    MaterialButton(
                      child: Text("add pet pictures"),
                      onPressed: model.selectPetPictures,
                    ),
                    if (model.images != null)
                      Container(
                        height: 120,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: model.images.length,
                          itemBuilder: (context, index) {
                            var pic = model.images[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AssetThumb(
                                asset: pic,
                                width: 100,
                                height: 100,
                              ),
                            );
                          },
                        ),
                      ),
                    MaterialButton(
                      child: Text("add pet"),
                      onPressed: model.addPet,
                    ),
                  ],
                ),
              ),
            )),
        onModelReady: (model) async {
          await model.init(context);
        },
        viewModelBuilder: () => AddPetViewModel());
  }
}

// Container(
//               color: Colors.white,
//               child: SingleChildScrollView(
//                 child: Container(
//                     color: Colors.white,
//                     child: Column(children: [
//                       FlatButton(
//                         child: Text("pick file"),
//                         onPressed: model.chooseFile,
//                       ),
//                       if (model.image?.path != null)
//                         Image.file(File(model.image.path)),
//                       FlatButton(
//                         child: Text("upload file"),
//                         onPressed: model.uploadFile,
//                       ),
//                       if (model.uploadedFileURL != null)
//                         Image.network(model.uploadedFileURL),
//                       FlatButton(
//                         child: Text("add doggo"),
//                         onPressed: model.addSomeAnimal,
//                       ),
//                       if (model.doggoAdded) Icon(Icons.approval)
//                     ])),
//               ),
//             )
