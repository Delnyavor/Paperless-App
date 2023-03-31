import 'package:flutter/material.dart';

class PluginData {
  final String image;
  final String title;
  final String desc;
  final bool enabled;

  const PluginData(
      {required this.image,
      required this.title,
      required this.desc,
      required this.enabled});
}
