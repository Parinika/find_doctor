import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  //@override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height - 30.0);
    var firstStart = Offset(size.width / 4, size.height + 25.0);
    var firstEnd = Offset(size.width / 1.5, size.height - 30.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 60);
    var secondEnd = Offset(size.width, size.height - 50.0);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClipperUpper extends CustomClipper<Path> {
  //@override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height - 10.0);
    var firstStart = Offset(size.width / 4, size.height - 100.0);
    var firstEnd = Offset(size.width / 1.85, size.height - 35.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart =
        Offset(size.width - (size.width / 5.24), size.height + 20.0);
    var secondEnd = Offset(size.width, size.height - 20.0);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
