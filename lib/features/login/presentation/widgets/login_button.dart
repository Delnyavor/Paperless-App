import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../account/presentation/pages/account_page.dart';

class LoginButton extends StatelessWidget {
  final String label;
  final Icon? icon;
  final String? image;
  final Color color;

  const LoginButton(
      {super.key,
      required this.label,
      this.icon,
      this.image,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        foregroundColor:
            color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(
          side: color.computeLuminance() > 0.7
              ? const BorderSide(color: Colors.black12, width: 0.5)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        maximumSize: Size(
          getValueForScreenType<double>(
              context: context, mobile: 1000, desktop: 450),
          getValueForScreenType<double>(
              context: context, mobile: kMinInteractiveDimension, desktop: 39),
        ),
        minimumSize: const Size(64, 30),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const AccountPage();
        }));
      },
      child: buttonChildren(),
    );
  }

  Widget buttonChildren() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: iconBuilder(),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(label),
          ),
        ],
      ),
    );
  }

  Widget iconBuilder() {
    if (icon != null) {
      return icon!;
    }
    if (image != null) {
      return Image.asset(
        image!,
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      );
    }
    return const SizedBox.shrink();
  }
}
