import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

import '../../../../common/spacers.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacingLarge,
        Center(
          child: ScreenTypeLayout.builder(
            desktop: (context) => logo(),
            mobile: (context) => textLogo(),
          ),
        ),
        verticalSpacingLarge,
      ],
    );
  }

  Widget logo() {
    return Image.asset('assets/icon_assets/logo.png');
  }

  Widget textLogo() {
    return Image.asset('assets/icon_assets/logo2.png', scale: 0.9);
  }
}
