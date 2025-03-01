import 'package:flutter/material.dart';
import 'package:stop/splash_screen/widgets/letter_paint.dart';

class AnimationLetter extends StatelessWidget {
  const AnimationLetter({
    super.key,
    required Animation<double> letterAnimation,
  }) : _letterAnimation = letterAnimation;

  final Animation<double> _letterAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
          animation: _letterAnimation,
          builder: (context, child) {
            return CustomPaint(
              size: const Size(200, 200),
                painter: LetterPainter(_letterAnimation.value,),
            );
          },
        );
  }
}