import 'package:find_your_doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:find_your_doctor/screens/signin_screen.dart';
import 'package:find_your_doctor/screens/signup_screen.dart';
import 'package:find_your_doctor/utils/color_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                btncolor,bgcolor])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 10,
            centerTitle: true,
            title: Text("Welcome to Find my Doctor",
                style: TextStyle(
                    fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
          ),
          body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assests/images/logo.jpg',
                    scale: 8.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Spacer(flex: 13),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(flex: 2),
                      Expanded(
                        flex: 6,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: btncolor,
                                onPrimary: Colors.white,
                                fixedSize: const Size(50, 40),
                                //padding: const EdgeInsets.symmetric(vertical: 12),
                                elevation: 2,
                                shape: (RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: btncolor)))),
                            child: Text(
                              'Sign In',
                              style: TextStyle(fontSize: 20.0),
                            )),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 6,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: hexStringToColor("#07689f"),
                                onPrimary: Colors.white,
                                fixedSize: const Size(50, 40),
                                // padding: const EdgeInsets.symmetric( vertical: 12),
                                elevation: 2,
                                shape: (RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: bgcolor)))),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 20.0),
                            )),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  Spacer(),
                ]),
          )),
    );
  }
}
