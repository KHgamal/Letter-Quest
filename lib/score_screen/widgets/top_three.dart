import 'package:flutter/material.dart';
import 'package:stop/score_screen/widgets/top_user.dart';

class TopThreeWidget extends StatelessWidget {
  const TopThreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TopUserWidget(rank: '2', name: 'Abdul Kadir', score: 50, color: Colors.orange, height: 80),
        
        TopUserWidget(rank: '1', name: 'Putri Indah', score: 150, color: Colors.green, height: 100 ,
        mainAxisAlignment: MainAxisAlignment.center,),

        TopUserWidget(rank: '3', name: 'Slamet', score: 40, color: Colors.red, height: 70),
      ],
    );
  }
}