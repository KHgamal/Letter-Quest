import 'package:flutter/material.dart';

class PinTextField extends StatelessWidget {
  const PinTextField({
    super.key,
    required TextEditingController pinController,
  }) : _pinController = pinController;

  final TextEditingController _pinController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: TextField(
        controller: _pinController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: "Enter PIN",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}