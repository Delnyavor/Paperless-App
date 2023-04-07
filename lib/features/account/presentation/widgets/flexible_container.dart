import 'package:flutter/material.dart';

class FlexContainer extends StatelessWidget {
  final Widget? child;
  final BoxConstraints? constraints;
  final Color? color;
  const FlexContainer({this.child, this.constraints, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      decoration: BoxDecoration(
          color: color ?? Colors.blue.shade500,
          // borderRadius: BorderRadius.circular(15),
          border: Border.all()),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
