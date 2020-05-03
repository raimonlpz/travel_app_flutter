import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 20.0,
            left: 20.0,
          ),
          child: Text(
            'All Reviews:',
            textAlign: TextAlign.left,
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
          ),
        ),
        new Review(
            "assets/img/travel.jpg",
            "Varuna Yasas",
            "1 review · 3 photos",
            "There is an amazing place in Sri Lanka!!",
            4),
        new Review(
            "assets/img/travel.jpg",
            "Javier Pasternak",
            "1 review · 5 photos",
            "There is an amazing place in Sri Lanka!!",
            2.5),
        new Review("assets/img/travel.jpg", "Lucy Liu", "1 review · 2 photos",
            "There is an amazing place in Sri Lanka!!", 5),
      ],
    );
  }
}
