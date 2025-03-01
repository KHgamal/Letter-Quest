import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

class LetterPainter extends CustomPainter {
  final double progress;

  LetterPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;

    // Define the "L" shape path
    Path letterPath = Path();
    letterPath.moveTo(size.width * 0.28, size.height * 0.1);
    letterPath.lineTo(size.width*0.28, size.height*0.2);
   
    letterPath.lineTo(size.width*0.35, size.height*0.23);

    letterPath.lineTo(size.width*0.35, size.height*0.73);

    letterPath.lineTo(size.width*0.28, size.height*0.78);
    letterPath.lineTo(size.width*0.28, size.height*0.88);
    letterPath.lineTo(size.width*0.73, size.height*0.88);
    
    letterPath.lineTo(size.width*0.77, size.height*0.85);

    letterPath.lineTo(size.width*0.77, size.height*0.63);
    letterPath.lineTo(size.width*0.7, size.height*0.62);
    letterPath.lineTo(size.width*0.66, size.height*0.72);
     letterPath.lineTo(size.width*0.52, size.height*0.73);

     letterPath.lineTo(size.width*0.52, size.height*0.24);
     letterPath.lineTo(size.width*0.58, size.height*0.2);
     letterPath.lineTo(size.width*0.58, size.height*0.1); 

     letterPath.close();

    // Extract part of the path based on progress
    PathMetrics pathMetrics = letterPath.computeMetrics();
    Path extractPath = Path();
    for (PathMetric metric in pathMetrics) {
      extractPath.addPath(
        metric.extractPath(0, metric.length * progress),
        Offset.zero,
      );
    }
    
    final Paint gradientPaint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(size.width, size.height),
        [
           const ui.Color.fromARGB(255, 164, 245, 237),
          const ui.Color.fromARGB(255, 4, 134, 190),
        //  Colors.indigo,
        ],
         [0.0, 1],
      );

    // Draw the animated "L"
    canvas.drawPath(extractPath, paint);

  // Fill the Letter with Gradient
   canvas.drawPath(letterPath, gradientPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}