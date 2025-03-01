import 'package:flutter/material.dart';

class ShareLinkSection extends StatelessWidget {
  const ShareLinkSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 230, 226, 226)
                // border: Border.all(),
                ),
            child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text('hetowo464iiwpoe37^9336')),
          ),
        ),
        IconButton(
          padding: const EdgeInsets.only(left: 12, right: 5),
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.copy),
          onPressed: () {},
        ),
        IconButton(
            padding: const EdgeInsets.only(left: 0, right: 0),
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: const Icon(Icons.share))
      ],
    );
  }
}