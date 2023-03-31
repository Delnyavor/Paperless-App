import 'package:flutter/material.dart';

class GalleryImg extends StatelessWidget {
  const GalleryImg({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
