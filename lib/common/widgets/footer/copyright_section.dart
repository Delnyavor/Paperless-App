import 'package:flutter/material.dart';

import 'footer_text.dart';

class CopyrightSection extends StatelessWidget {
  const CopyrightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/logo-dark.png'),
        const SizedBox(
          height: 4,
        ),
        const FooterText(text: 'Copyright 2022. All rights reserved')
      ],
    );
  }
}
