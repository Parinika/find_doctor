import 'package:find_your_doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:find_your_doctor/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:math';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _fyd = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Find your Doctor',
        theme: ThemeData(
          primaryColor: btncolor,
          scaffoldBackgroundColor: bgcolor,
        ),
        home: FutureBuilder(
            future: _fyd,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('you have an error! ${snapshot.error.toString()}');
                return Text('Something went wrong');
              } else if (snapshot.hasData) {
                return const WelcomeScreen();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })
        // const
        );
  }
}
