import 'package:flutter/material.dart';
import 'package:stop/room_selection/widgets/shield_clipper.dart';

class RoomPlayers extends StatelessWidget {
  const RoomPlayers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipPath(
          clipper: ShieldClipper(),
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 164, 245, 237),
                  Color.fromARGB(255, 4, 134, 190)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
                child: Text(
              "1",
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Text("youssef")
      ],
    );
  }
}