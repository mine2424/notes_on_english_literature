import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          iconSize: 26,
          onPressed: onPressed,
        ),
        const SizedBox(width: 8)
      ],
    );
  }
}
