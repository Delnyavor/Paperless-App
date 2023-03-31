import 'package:flutter/material.dart';
import 'package:paperless_app/features/account/presentation/widgets/navigation_rail.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../common/image_resources.dart';
import 'account_desktop_page.dart';
import 'account_mobile_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getValueForScreenType(
          context: context,
          mobile: appBar(),
          desktop: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
          )),
      body: ScreenTypeLayout.builder(
        mobile: (p0) => const AccountMobilePage(),
        desktop: (p0) => const AccountDesktopPage(),
      ),
      drawer: drawer(),
    );
  }

  Drawer drawer() {
    return const Drawer(
      child: SideNavigationRail(),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      title: Image.asset(ImageResources.appLogo, scale: 1.4),
      automaticallyImplyLeading: false,
      actions: [
        Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          );
        }),
      ],
    );
  }
}
