import 'package:flutter/material.dart';
import 'package:stop/game_room/widgets/fields_text_field.dart';

class FieldsCard extends StatelessWidget {
  const FieldsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        color: Colors.white,
        child: ListView(
          children: const [
            FieldsTextField(
                text: "Boy name", content: "Enter a boy name"),
            FieldsTextField(
                text: "Girl name", content: "Enter a girl name"),
            FieldsTextField(
                text: "Object", content: "Enter an object"),
            FieldsTextField(
                text: "Animal", content: "Enter an animal"),
            FieldsTextField(text: "Planet", content: "Enter a planet"),
            FieldsTextField(
                text: "Country", content: "Enter a country"),
          ],
        ),
      ),
    );
  }
}