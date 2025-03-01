import 'package:flutter/material.dart';

class TimeLimitSlider extends StatefulWidget {
  const TimeLimitSlider({super.key});

  @override
  State<TimeLimitSlider> createState() => _TimeLimitSliderState();
}

class _TimeLimitSliderState extends State<TimeLimitSlider> {
  double timeLimit = 5.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SliderTheme(
          data: SliderThemeData(
            trackShape: CustomTrackShape(),
          ),
          child: Slider(
            value: timeLimit,
            min: 1.0,
            max: 10.0,
            divisions: 9,
            label: '${timeLimit.toInt()} min',
            onChanged: (value) {
              setState(() {
                timeLimit = value;
              });
            },
          ),
        ),
        Text('${timeLimit.toInt()} min'),
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
