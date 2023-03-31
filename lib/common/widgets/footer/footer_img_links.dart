import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../image_resources.dart';

class FooterAppLinks extends StatelessWidget {
  const FooterAppLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisSize: MainAxisSize.min,
      children: [
        ImageResources.playStoreDL,
        ImageResources.appStoreDL,
      ]
          .map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(e),
              ))
          .toList(),
    );
  }
}

class FooterSocialLinks extends StatelessWidget {
  const FooterSocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FontAwesomeIcons.facebookF,
        FontAwesomeIcons.twitter,
        FontAwesomeIcons.instagram,
      ]
          .map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  e,
                  color: Colors.white,
                ),
              ))
          .toList(),
    );
  }
}
