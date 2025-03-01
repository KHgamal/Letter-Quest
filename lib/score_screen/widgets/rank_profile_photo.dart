import 'package:flutter/material.dart';
import 'package:stop/profile_photo.dart';

class RankProfilePhoto extends StatelessWidget {
  const RankProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 13.5,
          top: -40, // Moves the avatar upward
      child:ProfilePhoto(),
    );
  }
}