import 'package:flutter/material.dart';
import 'package:stop/custom_button.dart';
import 'package:stop/room_selection/widgets/dialog_header.dart';
import 'package:stop/room_selection/widgets/lock_icon.dart';
import 'package:stop/room_selection/widgets/pin_text_field.dart';
import 'package:stop/waiting_room/view/waiting_room.dart';

class LockDialog extends StatefulWidget {
  const LockDialog({super.key});

  @override
  LockDialogState createState() => LockDialogState();
}

class LockDialogState extends State<LockDialog> {
  final TextEditingController _pinController = TextEditingController();
  bool isLocked = true;
  bool isWrong = false;

  void checkPin() {
    String correctPin = "1234";
    if (_pinController.text == correctPin) {
      setState(() {
        isLocked = false;
        isWrong = false;
      });

      Future.delayed(const Duration(seconds: 1), () {
         Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WaitingScreen()),
      );
      });
    } else {
      setState(() {
        isWrong = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isWrong = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DialogHeader(text: 'Join Room'),
          const SizedBox(
            height: 16,
          ),
          LockIcon(isLocked: isLocked, isWrong: isWrong),
          const SizedBox(height: 16),
          PinTextField(pinController: _pinController),
          const SizedBox(height: 12),
          Custom3DButton(
            text: "join",
            onPressed: checkPin,
            color: const Color(0xFF51B7E5),
            textColor: Colors.white,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

