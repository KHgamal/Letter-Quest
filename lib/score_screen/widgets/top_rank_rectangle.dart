import 'package:flutter/material.dart';

class TopRankRectangle extends StatelessWidget {
  const TopRankRectangle({
    super.key,
    required this.rank,
  });

  final String rank;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      top: 12,
      child: Container(
        width: 50,
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(child: Text("# $rank", style: const TextStyle(color: Color(0xFF51B7E5), fontWeight: FontWeight.bold))),
      ),
    );
  }
}