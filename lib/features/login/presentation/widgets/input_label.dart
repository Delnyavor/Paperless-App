import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InputLabel extends StatelessWidget {
  final String label;
  const InputLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScreenTypeLayout.builder(
          mobile: (context) => const SizedBox.shrink(),
          desktop: (context) => Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
