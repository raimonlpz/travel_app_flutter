import 'package:generic_bloc_provider/generic_bloc_provider.dart';
//import 'travelify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bloc/bloc_user.dart';
import 'ui/signin_screen.dart';
//import 'bloc/bloc_place.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travelify',
        home: SignInScreen(), //Travelify(),
      ),
      bloc: UserBloc(),
    );
  }
}
