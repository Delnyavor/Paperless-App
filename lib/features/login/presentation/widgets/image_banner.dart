import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Image.asset('assets/images/forest.jpg', fit: BoxFit.cover));
  }
}
