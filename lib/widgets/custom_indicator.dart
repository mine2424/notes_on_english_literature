import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.black54,
        child: Center(
            child: Text(
          'Please wait a moment.',
          style: Theme.of(context).textTheme.bodyText1,
        )),
      ),
    );
  }
}
