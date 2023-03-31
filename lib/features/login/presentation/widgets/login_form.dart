import 'package:flutter/material.dart';
import 'package:paperless_app/common/spacers.dart';
import 'package:paperless_app/features/login/presentation/widgets/banner.dart';
import 'package:paperless_app/features/login/presentation/widgets/forgot_password_text.dart';
import 'package:paperless_app/features/login/presentation/widgets/login_input.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'input_label.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: getValueForScreenType<double>(
          context: context,
          mobile: 1000,
          desktop: 450,
        ),
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LoginBanner(),
            const InputLabel(
              label: 'Email',
            ),
            LoginInput(
              controller: emailCtrl,
              hint: 'Enter Email',
            ),
            verticalSpacingMedium,
            const InputLabel(
              label: 'Password',
            ),
            LoginInput(
              controller: passwordCtrl,
              hint: 'Create Password',
              obscure: true,
            ),
            verticalSpacingMin,
            const ForgotPasswordText(),
            verticalSpacingMedium,
          ],
        ),
      ),
    );
  }
}
