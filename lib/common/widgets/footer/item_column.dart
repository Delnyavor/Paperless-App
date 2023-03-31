import 'package:flutter/material.dart';
import 'package:paperless_app/common/widgets/footer/footer_text.dart';

class FooterColumn extends StatelessWidget {
  final List<String> items;
  const FooterColumn({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((e) => FooterText(
                  text: e,
                  heading: e == items.first,
                ))
            .toList(),
      ),
    );
  }
}
