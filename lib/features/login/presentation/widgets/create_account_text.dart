import 'package:flutter/material.dart';

import 'login_state_property_handlers.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text('Don\'t have an account?'),
        const SizedBox(width: 2),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(padding: LoginStateInsets(padding: 4)),
          child: const Text(
            'Join free today',
            style: TextStyle(color: Colors.pink),
          ),
        )
      ],
    );
  }
}
