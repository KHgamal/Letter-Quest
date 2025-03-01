import 'package:flutter/material.dart';
import 'package:stop/game_room/widgets/fields_card.dart';
import 'package:stop/game_room/widgets/room_control.dart';
import 'package:stop/game_room/widgets/wheel.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  String selectedLetter = "";
  bool isWheelVisible = true;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _showWheel());
  }

  void _showWheel() {
    _animationController.forward();
  }

  void _hideWheel() async {
    await _animationController.reverse();
    setState(() {
      isWheelVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                // Left Panel
                RoomControl(isWheelVisible: isWheelVisible, selectedLetter: selectedLetter),
                // Right Panel
               const Expanded(
                  child: FieldsCard(),
                ),
              ],
            ),
            if (isWheelVisible)
              Container(
                width: double.infinity,
                color: const Color.fromARGB(177, 0, 0, 0),
              ),
            // Spin Wheel Overlay
            if (isWheelVisible)
              Positioned.fill(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: SpinWheelExample(
                    onLetterSelected: (letter) {
                      setState(() {
                        selectedLetter = letter;
                      });
                      _hideWheel();
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
