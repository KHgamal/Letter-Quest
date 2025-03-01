import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xFF51B7E5),
            child: Icon(Icons.person, size: 30, color:Colors.white),
          );
  }
}