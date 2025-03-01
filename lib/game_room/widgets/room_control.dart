import 'package:flutter/material.dart';
import 'package:stop/game_room/widgets/room_players.dart';
import 'package:stop/score_screen/view/score_view.dart';

class RoomControl extends StatelessWidget {
  const RoomControl({
    super.key,
    required this.isWheelVisible,
    required this.selectedLetter,
  });

  final bool isWheelVisible;
  final String selectedLetter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          if (!isWheelVisible)
            Text(selectedLetter,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          const SizedBox(height: 10),
          const Text("0:48",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => const LeaderboardScreen()),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("STOP"),
          ),
          const SizedBox(height: 20),
          const RoomPlayers()
        ],
      ),
    );
  }
}