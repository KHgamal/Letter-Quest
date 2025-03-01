import 'package:flutter/material.dart';

class DialogHeader extends StatelessWidget {
  const DialogHeader({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        color: Color(0xFF51B7E5),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child:  Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
