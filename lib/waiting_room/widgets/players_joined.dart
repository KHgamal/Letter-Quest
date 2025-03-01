import 'package:flutter/material.dart';
import 'package:stop/profile_photo.dart';

class PlayersJoined extends StatelessWidget {
  const PlayersJoined({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
         ProfilePhoto(),
        // RankProfilePhoto(),
       ProfilePhoto(),
       ProfilePhoto(),
        CircleAvatar(
          backgroundColor: Color(0xFF51B7E5),
        ),
        CircleAvatar(
          backgroundColor: Color(0xFF51B7E5),
        )
      ],
    );
  }
}

