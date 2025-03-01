import 'package:flutter/material.dart';

class WaitingFadeText extends StatelessWidget {
  const WaitingFadeText({super.key, required this.word});
  final String word;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        word,
        style: const TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}