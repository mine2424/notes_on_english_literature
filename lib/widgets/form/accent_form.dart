import 'package:flutter/material.dart';

class AccentForm extends StatelessWidget {
  const AccentForm({
    required this.label,
    required this.controller,
    this.onChanged,
    this.textLines = 1,
  });

  final String label;
  final int? textLines;
  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              maxLines: textLines,
              cursorColor: Theme.of(context).accentColor,
              controller: controller,
              onChanged: onChanged,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  gapPadding: 16,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
