import 'package:flutter/material.dart';
import 'package:kramaai/screens/authenticate/background_welcome_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kramaai/shared/constants.dart';
import 'package:kramaai/shared/rounded_button.dart';
import 'login_screen.dart';


class WelcomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundWelcome(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text(
            "WELKOM BIJ SCOUTS MOLLEM",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Image.asset(
            "assets/images/logo_scoutsgidsenvl.png",
            width: size.width * 0.65,
          ),
          SizedBox(
              height: size.height * 0.05
          ),
          RoundedButton(
            text: "LOGIN",
            color: kSecondaryColor,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                  return Login(mode: 1);
                  },
                ),
              );
            },
          ),
          RoundedButton(
            text: "REGISTREER",
            color: kPrimaryColor,
            textColor: Colors.white,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                  return Login(mode: 0);
                  },
                ),
              );
            },
          ),
        ],),
    ));
  }
}
