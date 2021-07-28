import 'dart:io';

import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    required this.title,
    required this.image,
    this.isFile = false,
  });

  final String title;
  final String image;
  final bool isFile;

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
              duration: const Duration(milliseconds: 500),
              opacity: 0.5,
              child: _imageWidget(image),
            ),
          ),
          Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageWidget(String image) {
    return (image.isEmpty)
        ? Image.network(
            'https://cdn-ak.f.st-hatena.com/images/fotolife/k/kidsmoo1221/20190511/20190511234947.jpg',
            fit: BoxFit.cover,
            height: 120,
          )
        : (isFile == true)
            ? Image.file(File(image))
            : Image.network(
                image,
                fit: BoxFit.cover,
                height: 120,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      'can\'t read image 😢',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  );
                },
              );
  }
}
