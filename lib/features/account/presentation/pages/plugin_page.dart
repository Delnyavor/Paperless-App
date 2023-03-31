import 'package:flutter/material.dart';
import 'package:paperless_app/common/spacers.dart';
import 'package:paperless_app/features/account/domain/entities/plugin_data.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widgets/plugin_section.dart';

class PluginPage extends StatelessWidget {
  const PluginPage({super.key});

  final List<PluginData> generalPlugins = const [
    PluginData(
      image: 'assets/icon_assets/about_plugin_icon.png',
      title: 'About Section',
      desc: "Add an about section to your listings page",
      enabled: false,
    ),
    PluginData(
      image: 'assets/icon_assets/chat_plugin_icon.png',
      title: 'Live Chat',
      desc: "Include a live chat functionality to your listings ",
      enabled: false,
    ),
    PluginData(
      image: 'assets/icon_assets/faq_plugin_icon.png',
      title: 'FAQ',
      desc: "Add an FAQ section to your page",
      enabled: false,
    ),
    PluginData(
      image: 'assets/icon_assets/reviews_plugin_icon.png',
      title: 'Reviews',
      desc: "Allow users to add reviews to your listings",
      enabled: false,
    ),
    PluginData(
      image: 'assets/icon_assets/ammenities_plugin_icon.png',
      title: 'Utilities',
      desc: "Add a utillities/amenities section to your listings page",
      enabled: false,
    ),
  ];

  final List<PluginData> uniquePlugins = const [
    PluginData(
      image: 'assets/icon_assets/shoppinc_cart_plugin.png',
      title: 'Shopping Cart',
      desc:
          "This adds a shopping cart to your listings page. Users can select products and pay for them.",
      enabled: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getValueForScreenType(
          context: context, mobile: Colors.white, desktop: Colors.grey[50]),
      padding: getValueForScreenType(
          context: context,
          mobile: const EdgeInsets.only(top: 7, bottom: 50),
          desktop: const EdgeInsets.all(50)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PluginSection(
            data: generalPlugins,
            title: 'General',
          ),
          verticalSpacingLarge,
          PluginSection(
            data: uniquePlugins,
            title: 'Unique',
          ),
          getValueForScreenType(
            context: context,
            mobile: const SizedBox.shrink(),
            desktop: const SizedBox(
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
