import 'package:flutter/material.dart';
import 'ui/home_trips.dart';
import 'ui/search_trips.dart';
import 'ui/profile_trips.dart';

class Travelify extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Travelify();
  }
}

class _Travelify extends State<Travelify> {
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips(),
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.cyan,
        ),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30.0,
              ),
              title: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
