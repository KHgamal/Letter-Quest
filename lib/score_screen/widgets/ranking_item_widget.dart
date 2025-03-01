import 'package:flutter/material.dart';

class LeaderboardItemWidget extends StatelessWidget {
  final String name;
  final int level;

  const LeaderboardItemWidget({
    super.key,
    required this.name,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
         const SizedBox( width: 16,),
         Text("# $level", style: const TextStyle(fontWeight: FontWeight.bold)),
         const SizedBox( width: 12,),
        const CircleAvatar(
        backgroundColor:  Color.fromARGB(255, 83, 170, 207),
        child: Icon(Icons.person, color: Colors.white),
      ),
        const SizedBox( width: 16,),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
       ],
    );
  }
}