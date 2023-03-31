import 'package:flutter/material.dart';
import 'package:paperless_app/common/transitions/scroll_behaviour.dart';
import 'package:paperless_app/features/account/presentation/pages/page_handler.dart';

import '../widgets/account_page_title.dart';

class AccountMobilePage extends StatelessWidget {
  const AccountMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('mobile');
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: ScrollConfiguration(
        behavior: NoOverScrollGlowBehavior(),
        child: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AccountPageBreadCrumbs(),
            ),
            SliverToBoxAdapter(
              child: AccountPageHandler(),
            ),
          ],
        ),
      ),
    );
  }
}
