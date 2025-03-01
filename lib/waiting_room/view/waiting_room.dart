import 'package:flutter/material.dart';
import 'package:stop/custom_button.dart';
import 'package:stop/game_room/view/game_room.dart';
import 'package:stop/waiting_room/widgets/players_joined.dart';
import 'package:stop/waiting_room/widgets/waiting_fade_row.dart';
import 'package:stop/waiting_room/widgets/waiting_join_effect.dart';
import 'package:stop/waiting_room/widgets/waiting_scale_effect.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  WaitingScreenState createState() => WaitingScreenState();
}

class WaitingScreenState extends State<WaitingScreen>
    with TickerProviderStateMixin {

  late AnimationController _fadeController;
  late List<Animation<double>> _fadeAnimations;

  late AnimationController _dotController;

  @override
  void initState() {
    super.initState();

    // Fade-in animations for "for players to"
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    );

    _fadeAnimations = List.generate(4, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _fadeController,
          curve:
              Interval(index * 0.25, (index + 1) * 0.25, curve: Curves.easeIn),
        ),
      );
    });

    // Start fade-in after "Waiting" finishes
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) _fadeController.forward();
    });

    // Looping animation for the three dots (starts after "Join" appears)
    _dotController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    Future.delayed(const Duration(milliseconds: 3100), () {
      if (mounted) _dotController.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          // "Waiting" with scale animation
          const WaitingScaleEffect(),
          const SizedBox(height: 10),
          // "for players to" in one line
          WaitingFadeRow(fadeAnimations: _fadeAnimations),
          const SizedBox(height: 10),
          // "Join ..." in the next line (Join appears first, then dots)
          WaitingJoinEffect(fadeAnimations: _fadeAnimations, dotController: _dotController),
          const Spacer(),
          const SizedBox(
            height: 40,
          ),
          const PlayersJoined(),
          const SizedBox(
            height: 40,
          ),
          Custom3DButton(
            text: "Start",
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const GameScreen()),
            ),
            color: const Color(0xFF51B7E5),
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}