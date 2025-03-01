// Shield Shape for "QUEST"
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/room_selection/widgets/shield_clipper.dart';

class ShieldTile extends StatelessWidget {
  final String letter;

  const ShieldTile(this.letter, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ShieldClipper(),
      child: Container(
        width: 50,
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 164, 245, 237),
              Color.fromARGB(255, 4, 134, 190)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(3, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Text(
            letter,
            style: GoogleFonts.luckiestGuy(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}