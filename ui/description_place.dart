import 'package:flutter/material.dart';
import 'star_list.dart';
import 'button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  final String namePlace;
  final double stars;
  final String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    final description = Container(
      margin: new EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: new Text(
        descriptionPlace,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 14.5,
          color: Color(0xFF56575a),
        ),
      ),
    );

    final titleStars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 350.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            namePlace,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        StarList(stars, 25.0, 350.0),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titleStars,
        description,
        ButtonPurple('Navigate'),
      ],
    );
  }
}
