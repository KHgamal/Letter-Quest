import 'package:flutter/material.dart';
import 'package:stop/room_selection/widgets/create_dialog.dart';
import 'package:stop/custom_button.dart';
import 'package:stop/room_selection/widgets/letter_quest_title.dart';
import 'package:stop/room_selection/widgets/lock_dialog.dart';

class RoomSelectionView extends StatefulWidget {
  const RoomSelectionView({super.key});

  @override
  State<RoomSelectionView> createState() => _RoomSelectionViewState();
}

class _RoomSelectionViewState extends State<RoomSelectionView> with SingleTickerProviderStateMixin{
   late AnimationController _controller;
  late Animation<double> _crownAnimation;

  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600), 
    );

    _crownAnimation = TweenSequence([
    TweenSequenceItem(tween: Tween<double>(begin: 10, end: 5), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 5, end: 10), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 10, end: 5), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 5, end: 10), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 10, end: 5), weight: 1),
    ]).animate(_controller);
  }

  void animateCrownAndShowDialog(BuildContext context) {
    if (!isAnimating) {
      setState(() {
        isAnimating = true;
      });

      _controller.forward().whenComplete(() {
        setState(() {
          isAnimating = false;
        });

       showRoomSettingsDialog(context);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
     bool isDoorOpen = false;

  void openDoorAndShowLockDialog(context) {
    setState(() {
      isDoorOpen = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isDoorOpen = false;
      });

      showDialog(
        context: context,
        builder: (context) => const LockDialog(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LetterQuestTitle(),
          const SizedBox(
            height: 100,
          ),
          Custom3DButton(
            text: "Join Room",
            onPressed: () => openDoorAndShowLockDialog(context),
            color: Colors.white,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: isDoorOpen
                  ? const Icon(Icons.meeting_room,
                      key: ValueKey('open'), size: 28)
                  : const Icon(Icons.door_front_door,
                      key: ValueKey('closed'), size: 28),
            ),
          ),
          const SizedBox(height: 40),
          Custom3DButton(text: "create Room",   onPressed: () {
            _controller.reset();
            animateCrownAndShowDialog(context);
          },color: Colors.white,
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.person, size: 28),
               AnimatedBuilder(
                animation: _crownAnimation,
                builder: (context, child) {
                  return Positioned(
                    top: -20,
                    bottom: _crownAnimation.value,
                    left: 9,
                    child: Image.asset("assets/crown.png" , width: 10, height: 10,),
                  );
                },
              ),
            ],
          ),),
        ],
      ),
    );
  }
}
