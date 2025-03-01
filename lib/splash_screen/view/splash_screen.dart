import 'package:flutter/material.dart';
import 'package:stop/room_selection/views/room_selection.dart';
import 'package:stop/splash_screen/widgets/animation_letter.dart';
import 'package:stop/splash_screen/widgets/logo.dart';
import 'package:stop/splash_screen/widgets/splash_icon_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _iconController;
  late AnimationController _letterController;
  late Animation<double> _letterAnimation;

  final List<String> imagePaths = [
    'assets/lion.png',
    'assets/book.png',
    'assets/crocodile.png',
    'assets/earth.png',
    'assets/girl.png',
    'assets/vegetable.png',
    'assets/alphabet.png',
    'assets/boy.png',
  ];

  @override
  void initState() {
    super.initState();
    
    // Icon Rotation Animation
    _iconController = AnimationController(
      duration: const Duration(milliseconds:1500),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to RoomSelectionView
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RoomSelectionView()),
        );
      }
    });

    // draw Letter Animation
    _letterController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward().then((_) {
         // Start icon animation after letter animation finishes
        _iconController.forward();
      });

    _letterAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _letterController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _iconController.dispose();
    _letterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
     
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            
            Logo(size: size),

            // Rotating Icons Animation
            AnimatedBuilder(
              animation: _iconController,
              builder: (context, child) {
                return SplashIconList(size:size ,iconController: _iconController,imagePaths: imagePaths, );
              },
            ),

            // Letter Animation (Triggered after icons)
            AnimationLetter(letterAnimation: _letterAnimation),
          ],
        ),
      ),
    );
  }
}
