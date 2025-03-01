import 'package:flutter/material.dart';

class LockIcon extends StatelessWidget {
  const LockIcon({
    super.key,
    required this.isLocked,
    required this.isWrong,
  });

  final bool isLocked;
  final bool isWrong;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: isLocked
          ? Icon(Icons.lock,
              key: const ValueKey('locked'),
              size: 40,
              color: isWrong ? Colors.red : Colors.black)
          : const Icon(Icons.lock_open,
              key: ValueKey('unlocked'), size: 40, color: Colors.green),
    );
  }
}