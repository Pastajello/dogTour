import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources.dart';

class ExpandableCard extends StatelessWidget {
  final Function onTap;
  final String description;
  final String imageName;
  final bool reverse;

  ExpandableCard(
      {Key key,
      this.onTap,
      this.description,
      this.imageName,
      this.reverse = false})
      : super(key: key);

  final TextStyle textStyle =
      GoogleFonts.architectsDaughter(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          shadowColor: Colors.white38,
          child: InkWell(
              onTap: () => onTap?.call(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (reverse)
                    Center(
                      child: Container(
                        color: R.colors.main,
                        child: Text(
                          description ?? "",
                          textAlign: TextAlign.center,
                          style: textStyle,
                        ),
                      ),
                    ),
                  Center(child: Icon(Icons.ac_unit)),
                  if (!reverse)
                    Center(
                      child: Container(
                        color: R.colors.main,
                        child: Text(
                          description ?? "",
                          textAlign: TextAlign.center,
                          style: textStyle,
                        ),
                      ),
                    )
                ],
              )),
        ),
      ),
    );
  }
}
