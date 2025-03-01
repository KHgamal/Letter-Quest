import 'package:flutter/material.dart';

class PodiumItem extends StatelessWidget {
  const PodiumItem({
    super.key,
    required this.height,
    required this.color,
    required this.mainAxisAlignment,
    required this.name,
    required this.score,
  });

  final double height;
  final Color color;
  final MainAxisAlignment? mainAxisAlignment;
  final String name;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration:  BoxDecoration(
        borderRadius: const  BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        gradient: LinearGradient(colors: [color , color.withOpacity(0.5) , ]  ,begin: Alignment.topCenter , end:
          Alignment.bottomCenter)
      ),
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center),
          Text(score.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
