import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'login_state_property_handlers.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      //TODO: watch this
      mainAxisAlignment: getValueForScreenType(
          context: context,
          mobile: MainAxisAlignment.start,
          desktop: MainAxisAlignment.end),
      children: [
        TextButton(
          style: ButtonStyle(
              overlayColor: const LoginStateColor(),
              padding: LoginStateInsets()),
          onPressed: () {},
          child: const Text(
            'Forgot Password?',
            style: TextStyle(color: Colors.pink, fontSize: 12),
          ),
        )
      ],
    );
  }
}
