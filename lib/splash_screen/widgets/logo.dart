import 'package:flutter/material.dart';
import 'package:stop/splash_screen/widgets/letter_logo_border.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromARGB(255, 157, 212, 215),
        border: Border.all(width: 5, color: const Color.fromARGB(255, 82, 138, 130))
      ),
      child: const LetterLogoBorder(),
    );
  }
}