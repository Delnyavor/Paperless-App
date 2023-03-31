import 'package:flutter/material.dart';

import '../../spacers.dart';

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Subscribe to our newsletter',
          maxLines: 2,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            // fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
          ),
        ),
        verticalSpacingMedium,
        NewsletterField()
      ],
    );
  }
}

class NewsletterField extends StatelessWidget {
  const NewsletterField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            maxLines: 1,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Email address',
              hintStyle: const TextStyle(color: Colors.white30),
              contentPadding: const EdgeInsets.fromLTRB(0, 25, 15, 1.5),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5, color: Colors.grey.withOpacity(0.5))),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.pink)),
              suffixIcon: suffix(),
            ),
          ),
        ),
        // suffix(),
      ],
    );
  }

  Widget suffix() {
    return const Card(
      margin: EdgeInsets.zero,
      color: Colors.pink,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
        ),
      ),
    );
  }
}
