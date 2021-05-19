import 'package:flutter/material.dart';

class AccentForm extends StatelessWidget {
  const AccentForm({
    required this.label,
    required this.controller,
    this.textLines = 1,
  });

  final String label;
  final int? textLines;
  final TextEditingController controller;

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
              // TODO(mine2424): 要修正
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(6, 2),
                  blurRadius: 6.0,
                  spreadRadius: 3.0,
                ),
                // BoxShadow(
                //   color: Color.fromRGBO(255, 255, 255, 0.9),
                //   offset: Offset(-6, -2),
                //   blurRadius: 6.0,
                //   spreadRadius: 3.0,
                // ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(-6, -2),
                  blurRadius: 6.0,
                  spreadRadius: 3.0,
                )
              ],
            ),
            child: TextField(
              maxLines: textLines,
              cursorColor: Theme.of(context).accentColor,
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
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
