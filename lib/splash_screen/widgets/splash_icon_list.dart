import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stop/splash_screen/widgets/splash_icons.dart';

class SplashIconList extends StatelessWidget {
  final double size;
  final List<String> imagePaths;
  final AnimationController iconController;

  const SplashIconList({
    super.key,
    required this.size,
    required this.imagePaths,
    required this.iconController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(imagePaths.length, (index) {
        double angle =
                        (index * pi / 4) + (iconController.value * 2 * pi);
        final radius = size / 2.6;

        return SplashIcons(
          size: size,
          radius: radius,
          angle: angle,
          imagePaths: imagePaths[index],
        );
      }),
    );
  }
}