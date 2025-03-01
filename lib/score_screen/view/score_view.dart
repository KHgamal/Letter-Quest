import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stop/score_screen/widgets/ranking_list.dart';
import 'package:stop/score_screen/widgets/top_three.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Lottie.asset("assets/confetti.json" , height: 250 , width: double.infinity),
            const Column(
              children:  [
                 SizedBox(height: 100),
                 TopThreeWidget(),
                 Expanded(child: LeaderboardListWidget()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
