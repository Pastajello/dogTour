import 'package:dogtour_admin/models/permission_state.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_view_model.dart';
import '../../resources.dart';

class DashboardView extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<DashboardViewModel>.reactive(
        builder: (innerContext, model, child) => Scaffold(
            key: _drawerKey,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => _drawerKey.currentState.openDrawer(),
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.black,
                ),
              ),
              actions: <Widget>[
                if (model.canAddPet == PermissionState.allowed)
                  IconButton(
                    onPressed: () async {
                      await model.navigateToAddPet();
                    },
                    icon: Icon(
                      Icons.add,
                      size: 40,
                    ),
                    color: Colors.black,
                  ),
              ],
              backgroundColor: R.colors.main,
            ),
            drawer: Container(
              color: Colors.white,
              width: size.width * 0.8,
              child: ListView(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 200,
                    child: Center(
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 150,
                      ),
                    ),
                  ),
                  ...ListTile.divideTiles(context: innerContext, tiles: [
                    if (model.isSignedIn)
                      ListTile(
                        title: Text("Profile"),
                        leading: Icon(Icons.account_circle),
                        trailing: Icon(Icons.arrow_forward),
                      )
                    else
                      ListTile(
                        title: Text("Sign in"),
                        leading: Icon(Icons.account_circle),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: model.login,
                      ),
                    ListTile(
                      title: Text("Map"),
                      leading: Icon(Icons.map),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      title: Text("Organizations"),
                      leading: Icon(Icons.map),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      title: Text("Adopted"),
                      leading: Icon(Icons.map),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      title: Text("Virtualy adopted"),
                      leading: Icon(Icons.map),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      title: Text("Donations"),
                      leading: Icon(Icons.monetization_on),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    if (model.isSignedIn)
                      ListTile(
                        title: Text("Sign out"),
                        leading: Icon(Icons.logout),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: model.logout,
                      ),
                  ]).toList(),
                ],
              ),
            ),
            body: Container(
                color: Colors.white,
                child: RefreshIndicator(
                  onRefresh: () async => await model.getPets(),
                  child: ListView.builder(
                    itemCount: model.pets.length,
                    itemBuilder: (context, index) {
                      var pet = model.pets[index];
                      return InkWell(
                        onTap: () async =>
                            await model.navigateToPetDetais(pet, index),
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(pet.name),
                            leading: Hero(
                                tag: "petProfilePic$index",
                                child: Image.network(pet.profilePicUrl)),
                          ),
                        ),
                      );
                    },
                  ),
                ))),
        onModelReady: (model) async => await model.init(),
        viewModelBuilder: () => DashboardViewModel());
  }
}
