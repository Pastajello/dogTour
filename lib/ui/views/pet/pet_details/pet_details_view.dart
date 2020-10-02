import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'pet_details_view_model.dart';

class PetDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routeData = RouteData.of(context).arguments as List;
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<PetDetailsViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
                body: Stack(
              children: [
                Hero(
                    tag: "petProfilePic${routeData[1]}",
                    child: Container(
                      height: size.height * 0.70,
                      width: size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment(-.2, 0),
                            image: NetworkImage(model.pet.profilePicUrl),
                            fit: BoxFit.cover),
                      ),
                    )),
                SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      height: size.height * 0.65,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 16, right: 16, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.pet.name,
                                      style: GoogleFonts.fugazOne(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                    Text(
                                      model.pet.race,
                                      style: GoogleFonts.palanquin(
                                          height: 1,
                                          color: Colors.black,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                InkWell(
                                    child: Icon(
                                      model.isFavourite
                                          ? Icons.favorite
                                          : Icons.favorite_outline_outlined,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    onTap: model.setAsFavourite)
                              ],
                            ),
                            Container(
                              height: 150,
                              color: Colors.red,
                              width: size.width,
                            ),
                            Container(
                              height: 150,
                              color: Colors.blue,
                              width: size.width,
                            ),
                            Container(
                              height: 150,
                              color: Colors.green,
                              width: size.width,
                            ),
                            Container(
                              height: 150,
                              color: Colors.red,
                              width: size.width,
                            ),
                            Container(
                              height: 150,
                              color: Colors.yellow,
                              width: size.width,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
                buildArrowBack(context, model),
              ],
            )),
        onModelReady: (model) async {
          await model.init(context);
        },
        viewModelBuilder: () => PetDetailsViewModel(routeData[0]));
  }

  Padding buildArrowBack(BuildContext context, PetDetailsViewModel model) {
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8, left: 8),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              model.goBack();
            }),
      ),
    );
  }
}
