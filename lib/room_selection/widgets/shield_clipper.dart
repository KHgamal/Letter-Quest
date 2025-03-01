// Custom Shield Clipper
import 'package:flutter/material.dart';

class ShieldClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.5, 0); // Top center
    path.lineTo(size.width, size.height * 0.3); // Top right
    path.lineTo(size.width, size.height * 0.7); // Bottom right
    path.lineTo(size.width * 0.5, size.height); // Bottom center (point)
    path.lineTo(0, size.height * 0.7); // Bottom left
    path.lineTo(0, size.height * 0.3); // Top left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}