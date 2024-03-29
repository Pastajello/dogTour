import 'package:dogtour_admin/models/permission_state.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../resources.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashboardView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return ViewModelBuilder<DashboardViewModel>.reactive(
        builder: (innerContext, model, child) => Scaffold(
            key: _drawerKey,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => _drawerKey.currentState.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
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
                    color: Colors.white,
                  ),
              ],
              backgroundColor: R.colors.main,
            ),
            drawer: buildDrawer(size, innerContext, model),
            // bottomNavigationBar:
            // buildNavigationBar(model),
            body: Container(
                color: Colors.white,
                child: RefreshIndicator(
                  onRefresh: () async => await model.getPets(),
                  child: ListView.builder(
                    itemCount: model.pets.length,
                    itemBuilder: (context, index) {
                      var pet = model.pets[index];
                      return Padding(
                          padding: EdgeInsets.all(16),
                          child: InkWell(
                              onTap: () async =>
                                  await model.navigateToPetDetais(pet, index),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 99999,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.network(
                                      pet.profilePicUrl,
                                      fit: BoxFit.fill,
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5, color: Colors.grey)
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    height: 200,
                                  ),
                                  Text(
                                    pet.name,
                                    style: GoogleFonts.capriola(
                                        color: Colors.black, fontSize: 24),
                                  ),
                                  Text(
                                    pet.race,
                                    style: GoogleFonts.palanquin(
                                        height: 1,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                ],
                              )));
                    },
                  ),
                ))),
        onModelReady: (model) async => await model.init(),
        viewModelBuilder: () => DashboardViewModel());
  }

  Container buildNavigationBar(DashboardViewModel model) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20, color: Colors.black.withOpacity(.1))
                  ]),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                      gap: 8,
                      activeColor: Colors.white,
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      duration: Duration(milliseconds: 800),
                      tabBackgroundColor: Colors.grey[800],
                      tabs: [
                        GButton(
                          icon: Icons.home,
                          text: 'Home',
                        ),
                        GButton(
                          icon: Icons.hearing,
                          text: 'Likes',
                        ),
                        GButton(
                          icon: Icons.search,
                          text: 'Search',
                        ),
                        GButton(
                          icon: Icons.supervisor_account,
                          text: 'Profile',
                        ),
                      ],
                      selectedIndex: model.selectedIndex,
                      onTabChange: (index) {
                        model.changeTab(index);
                      }),
                ),
              ),
            )));
  }

  Container buildDrawer(
      Size size, BuildContext innerContext, DashboardViewModel model) {
    return Container(
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
    );
  }
}
