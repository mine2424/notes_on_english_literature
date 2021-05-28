import 'package:flutter/material.dart';

class FloatingCustomButton extends StatelessWidget {
  const FloatingCustomButton({
    required this.onPressed,
    required this.iconData,
    required this.label,
  });

  final VoidCallback onPressed;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      elevation: 24,
      isExtended: true,
      icon: Icon(iconData),
      label: Text(label),
    );
  }
}
