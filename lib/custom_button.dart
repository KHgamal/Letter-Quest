import 'package:flutter/material.dart';

class Custom3DButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Widget? icon ;
  final Color color;
  final Color? textColor;

  const Custom3DButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 150,
    this.height = 50, this.icon, required this.color, this.textColor = const Color.fromARGB(255, 83, 170, 207),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30 ),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity - 50,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               icon?? const SizedBox(),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color:textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
