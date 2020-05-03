import 'package:flutter/material.dart';

class StarList extends StatelessWidget {
  final double starRate;
  final double sizeIcon;
  final double topMargin;

  StarList(this.starRate, this.sizeIcon, this.topMargin);

  List<Widget> starFactory(double stars) {
    Widget star(IconData starType) {
      return Container(
        margin: EdgeInsets.only(top: topMargin, right: 3.0),
        child: Icon(
          starType,
          size: sizeIcon,
          color: Color(0xFFf2C611),
        ),
      );
    }

    List<Widget> starsList = [];
    double factor = 0;
    int resid;

    if (stars % 1 == 0.5) {
      stars -= 0.5;
      factor += 0.5;
    }
    for (var i = 0; i < stars; i++) {
      starsList.add(star(Icons.star));
    }

    if (factor > 0) {
      starsList.add(star(Icons.star_half));
    }

    resid = 5 - starsList.length;
    if (resid > 0) {
      for (var i = 0; i < resid; i++) {
        starsList.add(star(Icons.star_border));
      }
    }
    return starsList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: starFactory(starRate),
    );
  }
}
