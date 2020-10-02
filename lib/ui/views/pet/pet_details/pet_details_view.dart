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
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[400],
                                offset: Offset(0, 0),
                                blurRadius: 40,
                                spreadRadius: 0)
                          ],
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
                            buildMainInfoRow(model),
                            Container(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              child: ListView(
                                children: [
                                  MainInfoTile(
                                    value: model.pet.weight.toString(),
                                    description: "Weight",
                                  ),
                                  MainInfoTile(
                                    value: model.pet.age.toString(),
                                    description: "Age",
                                  ),
                                  MainInfoTile(
                                    value: model.pet.color + "aasdsd",
                                    description: "Color",
                                  ),
                                ],
                                scrollDirection: Axis.horizontal,
                              ),
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

  Row buildMainInfoRow(PetDetailsViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.pet.name,
              style: GoogleFonts.fugazOne(color: Colors.black, fontSize: 30),
            ),
            Text(
              model.pet.race,
              style: GoogleFonts.palanquin(
                  height: 1, color: Colors.black, fontSize: 18),
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
    );
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

class MainInfoTile extends StatelessWidget {
  final String value;
  final String description;
  const MainInfoTile({
    this.description,
    this.value,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
        height: 60,
        width: 110,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                textAlign: TextAlign.center,
                style: GoogleFonts.esteban(
                    fontSize: 18, fontWeight: FontWeight.w900),
              ),
              Text(
                description,
                style: GoogleFonts.esteban(
                    fontSize: 18, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
