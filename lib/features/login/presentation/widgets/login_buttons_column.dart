import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paperless_app/common/spacers.dart';
import 'package:paperless_app/features/login/presentation/widgets/create_account_text.dart';
import 'package:paperless_app/features/login/presentation/widgets/login_button.dart';

class LoginButtonColumn extends StatelessWidget {
  const LoginButtonColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          LoginButton(
            color: Colors.pink,
            label: 'Login',
          ),
          verticalSpacingLarge,
          Text('or'),
          verticalSpacingLarge,
          LoginButton(
            image: 'assets/icon_assets/google1.png',
            color: Colors.white,
            label: 'Continue with Google',
          ),
          verticalSpacingMedium,
          LoginButton(
            icon: Icon(Icons.apple, color: Colors.white),
            color: Colors.black,
            label: 'Continue with Apple',
          ),
          verticalSpacingMedium,
          LoginButton(
            icon: Icon(Icons.facebook, color: Colors.white),
            color: Colors.blue,
            label: 'Continue with Facebook',
          ),
          verticalSpacingMedium,
          LoginButton(
            icon: Icon(FontAwesomeIcons.twitter, color: Colors.white),
            color: Colors.lightBlueAccent,
            label: 'Continue with Twitter',
          ),
          verticalSpacingMedium,
          CreateAccountText(),
        ],
      ),
    );
  }
}
