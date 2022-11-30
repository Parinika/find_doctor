import 'package:find_your_doctor/constants.dart';
import 'package:find_your_doctor/utils/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find_your_doctor/utils/clipper.dart';
import 'package:find_your_doctor/screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:find_your_doctor/screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: btncolor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Image.asset(
          'assests/icons/logoLight.png',
          scale: 5.0,
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              //   child: Padding(
              // padding: EdgeInsets.fromLTRB(20, size.height * 0.20, 20, 0),
              child: Column(
                children: [
                  Stack(
                    fit: StackFit.loose,
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: ClipPath(
                            clipper: WaveClipper(),
                            child: Container(
                              color: btncolor,
                              height: size.height * 0.2,
                            )),
                      ),
                      ClipPath(
                          clipper: WaveClipperUpper(),
                          child: Container(
                            color: btncolor,
                            height: size.height * 0.25,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    width: size.width,
                    child: Text(
                      "Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: reusableTextField(
                        "Enter Email",
                        Icons.verified_user_outlined,
                        false,
                        _emailTextController,
                        size.height),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, size.height * 0.02, 20, 0),
                    child: reusableTextField(
                        "Enter Password",
                        Icons.lock_outline,
                        true,
                        _passwordTextController,
                        size.height),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, size.height * 0.02, 20, 0),
                    child: signInSignUpButton(context, true, () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      ).then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.fromLTRB(20, size.height * 0.02, 20, 0),
                      child: signUpOption()),
                ],
                // ),
              ))),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              " Sign Up",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
