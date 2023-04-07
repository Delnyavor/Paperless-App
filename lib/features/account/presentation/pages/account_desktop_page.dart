import 'package:flutter/material.dart';
import 'package:paperless_app/common/widgets/footer/footer.dart';
import 'package:paperless_app/features/account/presentation/pages/plugin_page.dart';
import 'package:paperless_app/features/account/presentation/widgets/account_page_title.dart';
import 'package:paperless_app/features/account/presentation/widgets/navigation_rail.dart';
import 'package:paperless_app/features/account/presentation/widgets/specific_need_section.dart';
// import 'package:paperless_app/features/account/presentation/pages/page_handler.dart';
// import 'package:paperless_app/features/account/presentation/pages/plugin_page.dart';
// import 'package:paperless_app/features/account/presentation/widgets/navigation_rail.dart';

// import '../../../../common/widgets/footer/footer.dart';
// import '../widgets/account_page_title.dart';
// import '../widgets/specific_need_section.dart';

import '../../../page_scaffolding/presentation/widgets/global_navbar.dart';
import '../../../../common/image_resources.dart';

class AccountDesktopPage extends StatelessWidget {
  const AccountDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        header(),
        const AccountPageBreadCrumbs(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SideNavigationRail(),
            Flexible(
              flex: 16,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Flexible(flex: 3, child: PluginPage()),
                    SpecificNeedsForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Footer()
      ]),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImageResources.appLogo,
            scale: 1.1,
          ),
          const GlobalNavBar(),
        ],
      ),
    );
  }
}
