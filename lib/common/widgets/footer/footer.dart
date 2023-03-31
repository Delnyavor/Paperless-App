import 'package:flutter/material.dart';
import 'package:paperless_app/common/widgets/footer/footer_img_links.dart';
import 'package:paperless_app/common/widgets/footer/subscription_section.dart';

import '../../app_colors.dart';
import 'copyright_section.dart';
import 'item_column.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const SizedBox.shrink(),
      desktop: (context) => Container(
        color: AppColors.footerColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 250),
          child: Column(children: [
            top(),
            const SizedBox(height: 50),
            bottom(),
          ]),
        ),
      ),
    );
  }

  Widget top() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CopyrightSection(),
        const FooterColumn(
          items: [
            'Services',
            'Home',
            'Explore',
            'FAQ',
            'Blog',
          ],
        ),
        const FooterColumn(
          items: [
            'About',
            'About Us',
            'Contact Us',
            'Terms of Use',
            'Privacy Policy',
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.pink,
            child: const Icon(Icons.keyboard_arrow_up),
          ),
        )
      ],
    );
  }

  Widget bottom() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Flexible(
          flex: 2,
          child: SubscriptionSection(),
        ),
        Expanded(flex: 5, child: FooterAppLinks()),
        Flexible(flex: 2, child: FooterSocialLinks()),
      ],
    );
  }
}
