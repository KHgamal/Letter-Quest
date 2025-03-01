import 'dart:math';

import 'package:flutter/material.dart';

class SplashIcons extends StatelessWidget {
  const SplashIcons({
    super.key,
    required this.size,
    required this.radius,
    required this.angle,
    required this.imagePaths,
  });

  final double size;
  final double radius;
  final double angle;
  final String imagePaths;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: size / 2 + radius * cos(angle) - 20,
      top: size  + radius * sin(angle) ,
      child: Image.asset(imagePaths, width:35, height: 35),
    );
  }
}
