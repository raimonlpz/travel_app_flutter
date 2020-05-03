import '../model/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../bloc/bloc_user.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  Widget showProfileData(AsyncSnapshot snapshot) {
    User user = User(
      name: snapshot.data.displayName,
      email: snapshot.data.email,
      photoURL: snapshot.data.photoUrl,
    );

    if (!snapshot.hasData || snapshot.hasError) {
      print('No loggeado');
      return Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0,
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text('No se pudo carga la información. Haz Login')
          ],
        ),
      );
    } else {
      print('Loggeado');
      return userInfo(user);
    }
  }

  Widget userInfo(User user) {
    final photo = Container(
      margin: EdgeInsets.only(
        top: 105.0,
        left: 20.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 3.0,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          //image: AssetImage(user.photoURL),
          image: NetworkImage(user.photoURL),
        ),
      ),
    );

    final username = Container(
      margin: EdgeInsets.only(
        left: 20.0,
        top: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            user.name,
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
              fontFamily: "Lato",
            ),
          ),
          Text(
            user.email,
            style: TextStyle(
              fontSize: 13.0,
              fontFamily: "Lato",
              color: Colors.white24,
            ),
          ),
        ],
      ),
    );

    return Row(
      children: <Widget>[
        photo,
        username,
        SizedBox(
          width: 50.0,
        ),
        Ink(
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.white,
            iconSize: 12.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Column(children: <Widget>[
              SizedBox(height: 100.0),
              CircularProgressIndicator(),
            ]);
          case ConnectionState.none:
            return Column(children: <Widget>[
              SizedBox(height: 100.0),
              CircularProgressIndicator(),
            ]);

          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
          default:
            return null;
        }
      },
    );
  }
}
