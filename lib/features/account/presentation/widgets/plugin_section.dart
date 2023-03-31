import 'package:flutter/material.dart';
import 'package:paperless_app/common/spacers.dart';
import 'package:paperless_app/features/account/domain/entities/plugin_data.dart';
import 'package:paperless_app/features/account/presentation/widgets/plugins.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PluginSection extends StatelessWidget {
  const PluginSection({super.key, required this.title, required this.data});
  final String title;
  final List<PluginData> data;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      sectionTitle(context),
      verticalSpacingMedium,
      ...data.map((e) => PluginWidget(data: e)).toList(),
    ]);
  }

  Widget sectionTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: getValueForScreenType(
        context: context,
        desktop: Border(
          bottom: BorderSide(color: Colors.grey[300]!, width: 0.5),
        ),
        mobile: Border(
          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
        ),
      )),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w800),
      ),
    );
  }
}
