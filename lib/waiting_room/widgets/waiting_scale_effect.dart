import 'package:flutter/material.dart';

class WaitingScaleEffect extends StatefulWidget {
  const WaitingScaleEffect({
    super.key,
  });
  @override
  State<WaitingScaleEffect> createState() => _WaitingScaleEffectState();
}

class _WaitingScaleEffectState extends State<WaitingScaleEffect>  with SingleTickerProviderStateMixin{
    late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Scale animation for "Waiting"
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOut),
    );
  }

   @override
  void dispose() {
    super.dispose();
    _scaleController.dispose();}

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale:_scaleAnimation,
      child: const Text(
        "Waiting",
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }
}