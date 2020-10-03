import 'package:dogtour_admin/ui/views/welcome/welcome_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      builder: (context, model, child) => Stack(
        children: [
          Image.network(
            "https://images.pexels.com/photos/4555468/pexels-photo-4555468.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            height: size.height,
            fit: BoxFit.fitHeight,
          ),
          AnimatedOpacity(
            opacity: model.loginOpacity,
            duration: Duration(milliseconds: 300),
            child: AnimatedContainer(
              alignment: Alignment.bottomCenter,
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.only(bottom: model.loginPadding),
              child: RoundedButton(
                onTap: model.navigateToLoginScreen,
                contentString: "Login",
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: model.registerOpacity,
            duration: Duration(milliseconds: 300),
            child: AnimatedContainer(
              alignment: Alignment.bottomCenter,
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.only(bottom: model.registerPadding),
              child: RoundedButton(
                onTap: model.navigateToRegistration,
                contentString: "Register",
              ),
            ),
          ),
        ],
      ),
      onModelReady: (model) async => await model.initialize(),
      viewModelBuilder: () => WelcomeViewModel(),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Function onTap;
  final String contentString;
  const RoundedButton({Key key, this.onTap, this.contentString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.amber,
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          contentString,
        ),
      ),
    );
  }
}
