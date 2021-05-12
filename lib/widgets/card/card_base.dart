import 'package:flutter/material.dart';

abstract class CardBase {
  const CardBase();

  Widget _card(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child(context),
        ),
      ),
    );
  }

  Widget show(BuildContext context) {
    return _card(context);
  }

  Widget child(BuildContext context);
}
