import 'package:flutter/material.dart';

import '../../../../common/spacers.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginBanner extends StatelessWidget {
  const LoginBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => child(),
      mobile: (context) => const SizedBox.shrink(),
    );
  }

  Widget child() {
    return OrientationLayoutBuilder(
      portrait: (context) => const SizedBox.shrink(),
      landscape: (context) => Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Welcome back'),
            verticalSpacingMin,
            Text(
              'Login to your account',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 26,
                color: Colors.black,
              ),
            ),
            verticalSpacingLarge,
          ],
        ),
      ),
    );
  }
}
