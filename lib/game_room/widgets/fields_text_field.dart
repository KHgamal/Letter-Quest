import 'package:flutter/material.dart';

class FieldsTextField extends StatelessWidget {
  const FieldsTextField({super.key, required this.text, required this.content});
  final String text;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(text, style: const TextStyle(fontWeight: FontWeight.bold , color: Color.fromARGB(255, 4, 134, 190))),
        const SizedBox(height: 8,),
        SizedBox(
          height: 40,
          child: TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(borderSide: BorderSide(color:  Color.fromARGB(255, 4, 134, 190),)),
              enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 4, 134, 190), )),
              focusedBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 4, 134, 190))),
              hintText: content,
              hintStyle: const TextStyle(color:  Color.fromARGB(255, 0, 9, 11)),
              contentPadding: const EdgeInsets.only(left: 12),
            ),
          ),
        ),
      ],),
    );
  }
}
