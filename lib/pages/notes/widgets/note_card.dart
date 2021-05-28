import 'package:flutter/material.dart';

import 'package:notes_on_english_literature/pages/notes/book/note_page.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    required this.image,
    required this.onLongPress,
  });

  final String image;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) => const NotePage(),
          ),
        );
      },
      onLongPress: onLongPress,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
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
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
