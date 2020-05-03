import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  IconData iconFav = Icons.favorite_border;
  bool buttonPressed = false;

  void onPressedFav() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Adding to your favorites..."),
      ),
    );

    setState(() {
      buttonPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF08AAA2),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(
        buttonPressed ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
      ),
    );
  }
}
