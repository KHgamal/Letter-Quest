import 'package:flutter/material.dart';

class LetterLogoBorder extends StatelessWidget {
  const LetterLogoBorder({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(width: 2.8, color: const Color.fromARGB(255, 6, 23, 120)),
      ),
      child: Container(
         margin: const EdgeInsets.all(16),       
        decoration:  BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
       border: Border.all(width: 2, color:  const Color.fromARGB(255, 6, 23, 120)),
      ),
      child: Image.asset("assets/bg.png"),
      ),
    );
  }
}