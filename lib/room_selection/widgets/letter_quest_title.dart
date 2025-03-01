import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/room_selection/widgets/shield_shape.dart';
class LetterQuestTitle extends StatelessWidget {
  const LetterQuestTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Letter',
          style: GoogleFonts.londrinaOutline(
              fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        // "QUEST" in Shield-Shaped Blocks
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['Q', 'U', 'E', 'S', 'T'].map((char) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ShieldTile(char),
            );
          }).toList(),
        ),
      ],
    );
  }
}