import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/pages/common/theme.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class BookCard extends StatelessWidget {
  const BookCard({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.black,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: 0.5,
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: 120,
              ),
            ),
          ),
          Center(
            child: Text(
              'great musicians!',
              style: context.bodyText2.copyWith(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
