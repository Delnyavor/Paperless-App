import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  final String text;
  final bool? heading;
  const FooterText({super.key, required this.text, this.heading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Text(
        text,
        maxLines: 1,
        style: TextStyle(
          fontSize: heading! ? 16 : 14,
          color: heading! ? Colors.pink : Colors.white,
          // fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
          height: 2,
        ),
      ),
    );
  }
}
