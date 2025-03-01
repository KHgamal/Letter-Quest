import 'package:flutter/material.dart';
import 'package:stop/waiting_room/widgets/waiting_fade_text.dart';

class WaitingFadeRow extends StatelessWidget {
  const WaitingFadeRow({
    super.key,
    required List<Animation<double>> fadeAnimations,
  }) : _fadeAnimations = fadeAnimations;

  final List<Animation<double>> _fadeAnimations;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeTransition(opacity: _fadeAnimations[0], child: const WaitingFadeText(word:  "for")),
        FadeTransition(
            opacity: _fadeAnimations[1], child: const WaitingFadeText(word: "players")),
        FadeTransition(opacity: _fadeAnimations[2], child: const WaitingFadeText(word: "to")),
      ],
    );
  }
}