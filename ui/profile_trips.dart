import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'gradient_back.dart';
import 'floating_action_button_green.dart';
import 'profile_circle_button.dart';
import '../bloc/bloc_user.dart';
import 'profile_header.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Stack(
      children: <Widget>[
        GradientBack('Profile', 375.0, -0.9, -0.7),
        Column(
          children: <Widget>[
            BlocProvider(
              bloc: UserBloc(),
              child: ProfileHeader(),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // CAMBIAR CONTRASEÑA
                  ProfileCircleButton(
                    iconType: Icons.vpn_key,
                    iconSize: 20.0,
                    containerSize: 40.0,
                    color: Colors.teal[50],
                    onPressed: () {},
                  ),

                  // ProfileCircleButton(
                  //   iconType: Icons.card_giftcard,
                  //   iconSize: 20.0,
                  //   containerSize: 40.0,
                  //   color: Colors.grey[200],
                  //   onPressed: () {},
                  // ),

                  // AÑADIR NUEVO LUGAR
                  ProfileCircleButton(
                    iconType: Icons.add,
                    iconSize: 45.0,
                    containerSize: 70.0,
                    color: Colors.white,
                    onPressed: () {},
                  ),

                  // ProfileCircleButton(
                  //   iconType: Icons.mail_outline,
                  //   iconSize: 20.0,
                  //   containerSize: 40.0,
                  //   color: Colors.grey[200],
                  //   onPressed: () {},
                  // ),

                  // CERRAR SESION
                  ProfileCircleButton(
                    iconType: Icons.exit_to_app,
                    iconSize: 20.0,
                    containerSize: 40.0,
                    color: Colors.teal[50],
                    onPressed: () {
                      userBloc.signOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 263.0),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  profileSlides(
                      "assets/img/land1.jpg", "Knuckles Mountain Range"),
                  profileSlides("assets/img/land2.jpg", "Sonora Desert"),
                  profileSlides("assets/img/land3.jpg", "Nevada, Florida"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget profileSlides(String imagePath, String title) {
    final cardImage = Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 90.0),
        height: 200,
        width: 330,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 15.0,
              offset: Offset(0.0, 7.0),
            )
          ],
        ),
      ),
    );

    final descriptionImage = Center(
      child: Container(
        margin: EdgeInsets.only(top: 140.0),
        height: 120,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          shape: BoxShape.rectangle,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lato",
                  fontSize: 17.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Hiking, Water fall hunting, Natural bath, Scenery & Photography',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: "Lato",
                  fontSize: 10.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Steps 33,104,129',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontFamily: "Lato",
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        cardImage,
        descriptionImage,
        Container(
          margin: EdgeInsets.only(
            top: 220.0,
            left: 230.0,
          ),
          child: FloatingActionButtonGreen(),
        ),
      ],
    );
  }
}
