import 'package:flutter/material.dart';
import 'package:paperless_app/features/login/presentation/pages/login_page_mobile.dart';

import '../widgets/image_banner.dart';

// import '../widgets/login_buttons_column.dart';

class LoginDesktopPage extends StatelessWidget {
  const LoginDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: ImageBanner()),
        Expanded(
          child: LoginMobilePage(),
        ),
      ],
    );
  }
}
