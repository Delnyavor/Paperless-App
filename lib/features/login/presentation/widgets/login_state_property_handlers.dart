import 'package:flutter/material.dart';

class LoginStateColor extends MaterialStateColor {
  final Color? color;
  const LoginStateColor({this.color}) : super(_defaultColor);

  static const int _defaultColor = 0xffffffff;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.transparent;
    }
    if (states.contains(MaterialState.hovered)) {
      return Colors.transparent;
    }

    return const Color(_defaultColor);
  }
}

class LoginStateInsets extends MaterialStateProperty<EdgeInsets> {
  final double? padding;
  LoginStateInsets({this.padding});

  @override
  EdgeInsets resolve(Set<MaterialState> states) {
    return EdgeInsets.symmetric(horizontal: padding ?? 0.0);
  }
}
