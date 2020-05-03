import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'bloc/bloc_user.dart';
import 'ui/home_trips.dart';
import 'ui/search_trips.dart';
import 'ui/profile_trips.dart';

class TravelifyCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.indigoAccent),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.indigoAccent),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.indigoAccent),
              title: Text(""),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                    bloc: UserBloc(),
                    child: ProfileTrips(),
                  );
                },
              );
              break;
            default:
              return null;
          }
        },
      ),
    );
  }
}
