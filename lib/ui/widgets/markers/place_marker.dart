import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceMarker extends StatelessWidget {
  final Function onTap;

  const PlaceMarker({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        child: Image.asset("assets/images/marker.png"),
      ),
    );
  }
}
