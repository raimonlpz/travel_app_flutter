import 'package:flutter/material.dart';
import 'star_list.dart';

class Review extends StatelessWidget {
  final String pathImage;
  final String name;
  final String details;
  final String comment;
  final double rate;

  Review(this.pathImage, this.name, this.details, this.comment, this.rate);

  @override
  Widget build(BuildContext context) {
    final userComment = Container(
      margin: EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 13.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.w900,
        ),
      ),
    );

    final userInfo = Container(
      margin: EdgeInsets.only(
        left: 20.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            details,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 13.0,
              fontFamily: "Lato",
              color: Color(0xFFa3a5a7),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          StarList(rate, 18.0, 0.0),
        ],
      ),
    );

    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 17.0,
          fontFamily: "Lato",
        ),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfo,
        userComment,
      ],
    );

    final photo = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage),
        ),
      ),
    );

    return Row(
      children: <Widget>[
        photo,
        userDetails,
      ],
    );
  }
}
