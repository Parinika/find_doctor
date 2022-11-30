import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_your_doctor/auth.dart';
import 'package:find_your_doctor/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find_your_doctor/utils/clipper.dart';
import '../constants.dart';
import '../utils/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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
                              height: size.height * 0.15,
                            )),
                      ),
                      ClipPath(
                          clipper: WaveClipperUpper(),
                          child: Container(
                            color: btncolor,
                            height: size.height * 0.15,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: size.width,
                    child: Text(
                      "Sign Up",
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
                        "Enter Username",
                        Icons.person_add_alt_1_outlined,
                        false,
                        _userNameTextController,
                        size.height),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, size.height * 0.02, 20, 0),
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
                    child: signInSignUpButton(context, false, () {
                      _firebaseAuth
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then(
                        (value) {
                          FirebaseFirestore.instance
                              .collection('UserData')
                              .doc(value.user?.uid)
                              .set({
                            "email": value.user?.email,
                            // "name":_userNameTextController
                          });
                        },
                      ).then((value) {
                        print("Created new account");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
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
        const Text("Already have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            child: const Text(
              " Sign In",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
