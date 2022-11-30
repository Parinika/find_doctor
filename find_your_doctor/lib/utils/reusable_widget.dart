import 'package:find_your_doctor/constants.dart';
import 'package:flutter/material.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, double height) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(148, 0, 0, 0),
    style: TextStyle(
        color: Colors.black, height: height * 0.0005),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromARGB(148, 0, 0, 0),
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Color.fromARGB(148, 0, 0, 0),
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.6),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    // margin: const EdgeInsets.fromLTRB(left, top, right, bottom),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
    child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          isLogin ? 'LOGIN' : 'SIGN UP',
          style: TextStyle(
              color: btncolor, fontWeight: FontWeight.bold, fontSize: 19),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))))),
  );
}

Row drDisplay(BuildContext context,String name1, String image1, String dr1,String name2, String image2, String dr2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      display(context, name1, image1, dr1),
      SizedBox(width: MediaQuery.of(context).size.width*0.025,),
      display(context, name2, image2, dr2),
    ],
  );
}

Container display(BuildContext context, String name, String image, String dr) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.45,
    height: MediaQuery.of(context).size.height * 0.2,
    margin: const EdgeInsets.fromLTRB(1, 1, 1, 1),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), color: btncolor.withOpacity(0.50)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Image.asset(image),
        ),
        Container(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            )),
        Container(
          padding: EdgeInsets.only(top: 7, bottom: 20),
          // decoration: BoxDecoration(
          //   color: Colors.white.withOpacity(0.01),
          // ),
          child: Text(
            dr,
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.white,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    ),
  );
}

Widget demoCategories(String image, String name, String drQuantity) {
  return Container(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 4),
          padding: EdgeInsets.only(top: 7, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.01),
          ),
          child: Text(
            drQuantity,
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.white.withOpacity(0.01),
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    ),
  );
}
  //   child: ElevatedButton(
  //       onPressed: () {
  //         onTap();
  //       },
  //       child: Text(
  //         isLogin ? 'LOGIN' : 'SIGN UP',
  //         style: TextStyle(
  //             color: btncolor, fontWeight: FontWeight.bold, fontSize: 19),
  //       ),
  //       style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.resolveWith((states) {
  //             if (states.contains(MaterialState.pressed)) {
  //               return Colors.black26;
  //             }
  //             return Colors.white;
  //           }),
  //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //               RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(15.0))))),
//   );
// }
