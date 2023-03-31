import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paperless_app/features/login/presentation/pages/login_page_desktop.dart';
import 'package:paperless_app/features/login/presentation/pages/login_page_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   toolbarHeight: 0,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarBrightness: Brightness.light,
      //     statusBarColor: Colors.transparent,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      // ),
      body: ScreenTypeLayout.builder(
          breakpoints:
              const ScreenBreakpoints(tablet: 0, desktop: 1500, watch: 200),
          mobile: (context) => OrientationLayoutBuilder(
                portrait: (BuildContext context) => const LoginMobilePage(),
                landscape: (BuildContext context) => const LoginMobilePage(),
              ),
          desktop: (context) {
            return OrientationLayoutBuilder(
              portrait: (BuildContext context) => const LoginMobilePage(),
              landscape: (BuildContext context) => const LoginDesktopPage(),
            );
          }),
    );
  }
}
