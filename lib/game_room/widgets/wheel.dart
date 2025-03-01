import 'dart:async';
import 'dart:math'; // Import the math library
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinWheelExample extends StatefulWidget {
  final Function(String) onLetterSelected;
  const SpinWheelExample({super.key, required this.onLetterSelected});

  @override
  SpinWheelExampleState createState() => SpinWheelExampleState();
}

class SpinWheelExampleState extends State<SpinWheelExample> {
  final List<String> letters = List.generate(26, (index) => String.fromCharCode(65 + index));
  final StreamController<int> controller = StreamController<int>();
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => spinWheel());
  }

  void spinWheel() async {
    final randomIndex = random.nextInt(letters.length);
    controller.add(randomIndex);
     await Future.delayed(const Duration(seconds: 5)); // Spin animation duration
    widget.onLetterSelected(letters[randomIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: FortuneWheel(
          animateFirst: false,
          hapticImpact: HapticImpact.light,
          indicators: const [
            FortuneIndicator(
              alignment: Alignment.topCenter,
              child: TriangleIndicator(
                color: Colors.white,
                width: 30,
                height: 30,
                elevation: 5,
              ),
            ),
          ],
          selected: controller.stream,
          items: List.generate(letters.length, (index) {
            return FortuneItem(
              child:  Transform.translate(
                offset: const Offset(50, 0),
                child: Text(
                  letters[index],
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              style: FortuneItemStyle(
                color: Colors.primaries[index % Colors.primaries.length].shade300,
                borderColor: Colors.black,
                borderWidth: 1,
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}
