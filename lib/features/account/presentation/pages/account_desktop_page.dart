import 'package:flutter/material.dart';
import 'package:paperless_app/features/account/presentation/pages/page_handler.dart';
import 'package:paperless_app/features/account/presentation/pages/plugin_page.dart';
import 'package:paperless_app/features/account/presentation/widgets/navigation_rail.dart';

import '../../../../common/image_resources.dart';
import '../../../../common/widgets/footer/footer.dart';
import '../../../page_scaffolding/presentation/widgets/global_navbar.dart';
import '../widgets/account_page_title.dart';
import '../widgets/specific_need_section.dart';

class AccountDesktopPage extends StatelessWidget {
  const AccountDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: header(),
        ),
        const SliverToBoxAdapter(
          child: AccountPageBreadCrumbs(),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Expanded(
                  flex: 3,
                  child: SideNavigationRail(),
                ),
                Expanded(
                  flex: 8,
                  child: AccountPageHandler(),
                ),
                Expanded(
                  flex: 3,
                  child: SpecificNeedsForm(),
                )
              ],
            ),
          ),
        ])),
        const SliverToBoxAdapter(
          child: Footer(),
        ),
      ],
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
