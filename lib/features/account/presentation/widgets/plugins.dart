import 'package:flutter/material.dart';
import 'package:paperless_app/common/spacers.dart';
import 'package:paperless_app/features/account/domain/entities/plugin_data.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PluginWidget extends StatefulWidget {
  final PluginData data;
  const PluginWidget({super.key, required this.data});

  @override
  State<PluginWidget> createState() => _PluginWidgetState();
}

class _PluginWidgetState extends State<PluginWidget> {
  late bool enabled;

  @override
  void initState() {
    super.initState();
    enabled = widget.data.enabled;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: getValueForScreenType(
              context: context, mobile: Colors.grey[50], desktop: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ScreenTypeLayout.builder(
        desktop: (p0) => desktopView(),
        mobile: (p0) => mobile(),
      ),
    );
  }

  Widget desktopView() {
    return ListTile(
      leading: image(),
      title: title(),
      subtitle: desc(),
      trailing: button(),
      contentPadding: const EdgeInsets.all(0),
      // isThreeLine: true,
    );
  }

  Widget mobile() {
    return Wrap(
      alignment: WrapAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            image(),
            horizontalSpacingSmall,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(),
                  verticalSpacingTiny,
                  desc(),
                  verticalSpacingTiny,
                ],
              ),
            )
          ],
        ),
        button(),
      ],
    );
  }

  Widget image() {
    return CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(widget.data.image),
    );
  }

  Widget title() {
    return Text(
      widget.data.title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
    );
  }

  Widget desc() {
    return Text(
      widget.data.desc,
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget button() {
    return TextButton(
        onPressed: () {
          setState(() {
            enabled = !enabled;
          });
        },
        style: TextButton.styleFrom(
            minimumSize: const Size(100, 40),
            backgroundColor: !enabled ? Colors.transparent : Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: const BorderSide(color: Colors.pink, width: 1),
            )),
        child: Text(
          enabled ? 'Enable' : 'Disable',
          style: TextStyle(color: enabled ? Colors.white : Colors.pink),
        ));
  }
}
