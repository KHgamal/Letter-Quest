import 'package:flutter/material.dart';

class WaitingJoinEffect extends StatelessWidget {
  const WaitingJoinEffect({
    super.key,
    required List<Animation<double>> fadeAnimations,
    required AnimationController dotController,
  }) : _fadeAnimations = fadeAnimations, _dotController = dotController;

  final List<Animation<double>> _fadeAnimations;
  final AnimationController _dotController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeTransition(
            opacity: _fadeAnimations[2],
            child: const Text(
              "Join",
              style: TextStyle(
                  color: Color(0xFF51B7E5),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            )),
        // Three dots animation (starts after "Join" appears)
        AnimatedBuilder(
          animation: _dotController,
          builder: (context, child) {
            int dots = ((_dotController.value * 3).round()) % 4;
            return Text(
              "." * dots,
              style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF51B7E5)),
            );
          },
        ),
      ],
    );
  }
}
