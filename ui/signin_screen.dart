import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import '../travelify_cupertino.dart';
import 'gradient_back.dart';
import 'button_login.dart';
import '../bloc/bloc_user.dart';
import '../travelify.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // snapshot contiene data - object user
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return Travelify();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null, 0.0, 0.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome. \n This is your Travel App.",
                style: TextStyle(
                  fontSize: 27.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ButtonLogin(
                text: "Login with Gmail",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((FirebaseUser user) =>
                      print("User is: ${user.displayName}"));
                },
                width: 300.0,
                height: 50.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
