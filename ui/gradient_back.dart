import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  final String title;
  final double heightBack;
  final double alignmentX;
  final double alignmentY;

  GradientBack(this.title, this.heightBack, this.alignmentX, this.alignmentY);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightBack,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4268D3),
            Color(0xFF08AAA2),
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold,
        ),
      ),
      alignment: Alignment(alignmentX, alignmentY),
    );
  }
}
