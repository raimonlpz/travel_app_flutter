import 'package:flutter/material.dart';

class ProfileCircleButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData iconType;
  final double iconSize;
  final double containerSize;
  final Color color;

  ProfileCircleButton({
    this.iconType,
    this.iconSize,
    this.containerSize,
    this.color,
    @required this.onPressed,
  });

  @override
  _ProfileCircleButtonState createState() => _ProfileCircleButtonState();
}

class _ProfileCircleButtonState extends State<ProfileCircleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.containerSize,
      child: Center(
        child: Ink(
          child: IconButton(
            icon: Icon(widget.iconType),
            color: Colors.blueAccent,
            onPressed: widget.onPressed,
            iconSize: widget.iconSize,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
    );
  }
}
