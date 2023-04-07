import 'package:flutter/material.dart';
import 'package:paperless_app/common/transitions/scroll_behaviour.dart';
import 'package:paperless_app/features/login/presentation/widgets/login_form.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widgets/login_buttons_column.dart';
import '../widgets/logo.dart';

class LoginMobilePage extends StatelessWidget {
  const LoginMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoOverScrollGlowBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(
          getValueForScreenType(
            context: context,
            mobile: 28.0,
            desktop: 40.0,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: const [
              LogoSection(),
              LoginForm(),
              LoginButtonColumn(),
            ],
          ),
        ),
      ),
    );
  }
}
