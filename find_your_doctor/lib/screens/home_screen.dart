import 'package:find_your_doctor/auth.dart';
import 'package:find_your_doctor/constants.dart';
import 'package:find_your_doctor/screens/welcome_screen.dart';
import 'package:find_your_doctor/utils/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find_your_doctor/utils/clipper.dart';
import 'package:find_your_doctor/screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:find_your_doctor/screens/home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = Auth().currentUser;
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
          ),
          actions: [
            IconButton(
              constraints: BoxConstraints.expand(width: 80),
              icon: const Text(
                'Logout',
                textAlign: TextAlign.center,
                // style: fontSiz,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                });
              },
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 200.0,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: btncolor,
                  ),
                  accountName: Text(
                    // user?.name ?? 'User name',
                    "",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                  accountEmail: Text(
                    user?.email ?? 'User email',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                  currentAccountPicture: Icon(
                    Icons.account_circle,
                    size: 75.0,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Item 1',
                  style: TextStyle(color: btncolor, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Item 2',
                  style: TextStyle(color: btncolor, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            //   child: Padding(
            // padding: EdgeInsets.fromLTRB(20, size.height * 0.20, 20, 0),
            child: Column(children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: size.width,
                    child: Text(
                      "Hi,",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                    width: size.width,
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x140000000),
                            offset: Offset(0, 10),
                            blurRadius: 15,
                            spreadRadius: 0,
                          )
                        ]),
                    height: 60,
                    width: size.width,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                maxLines: 1,
                                autofocus: false,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search"),
                              )),
                        ),
                        //   ],
                        // ),
                        Expanded(
                          flex: 1,
                          child: Container(
                              decoration: BoxDecoration(
                                color: btncolor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: size.width,
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, size.height * 0.02, 0, 0),
                    child: drDisplay(
                        context,
                        "Neurologist",
                        "assests/icons/brain.png",
                        "8 doctors",
                        "orthopedist",
                        "assests/icons/bone.png",
                        "11 Doctors"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, size.height * 0.02, 0, 0),
                    child: drDisplay(
                        context,
                        "Opthalmologist",
                        "assests/icons/eye.png",
                        "15 doctors",
                        "Gynecologist",
                        "assests/icons/gynecologist.png",
                        "9 Doctors"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, size.height * 0.02, 0, 0),
                    child: drDisplay(
                        context,
                        "Psycologist",
                        "assests/icons/psychologist.png",
                        "12 doctors",
                        "Cardiologist",
                        "assests/icons/heart.png",
                        "11 Doctors"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, size.height * 0.02, 0, 0),
                    child: drDisplay(
                        context,
                        "Dentist",
                        "assests/icons/tooth.png",
                        "17 doctors",
                        "See All",
                        "assests/icons/doctor.png",
                        ""),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
