import 'package:flutter/material.dart';
import 'description_place.dart';
import 'header_appbar.dart';
import 'review_list.dart';

class HomeTrips extends StatelessWidget {
  final String descriptionDummy =
      'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text.';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace("Bahamas", 4, descriptionDummy),
            ReviewList(),
          ],
        ),
        HeaderAppBar(),
      ],
    );
  }
}
