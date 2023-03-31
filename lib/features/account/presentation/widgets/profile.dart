import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paperless_app/common/image_resources.dart';
import 'package:paperless_app/common/spacers.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(ImageResources.lady),
          radius: 36,
        ),
        verticalSpacingMedium,
        Text(
          'Audrey Nana',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        verticalSpacingTiny,
        Text(
          'audrey.nana@gmail.com',
          style: TextStyle(color: Colors.grey[700]),
        ),
        verticalSpacingLarge,
      ],
    );
  }
}
