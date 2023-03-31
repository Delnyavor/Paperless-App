import 'package:flutter/material.dart';
import 'package:paperless_app/common/spacers.dart';

import '../../../../common/image_resources.dart';
import '../widgets/document_drop_down.dart';
import '../widgets/upload_button.dart';
import '../widgets/upload_widget.dart';

class KycMobilePage extends StatefulWidget {
  const KycMobilePage({super.key});

  @override
  State<KycMobilePage> createState() => _KycMobilePageState();
}

class _KycMobilePageState extends State<KycMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: [
          verticalSpacingSmall,
          title(),
          verticalSpacingLarge,
          desc(),
          verticalSpacingLarge,
          label(),
          verticalSpacingTiny,
          const DocTypeSelector(),
          verticalSpacingMedium,
          verticalSpacingMedium,
          const Center(
            child: UploadWidget(
              hint: 'Upload an image of the front',
              iconPath: 'assets/icon_assets/id_front.png',
              front: true,
            ),
          ),
          verticalSpacingLarge,
          const Center(
            child: UploadWidget(
              hint: 'Upload an image of the back',
              iconPath: 'assets/icon_assets/id_back.png',
              front: false,
            ),
          ),
          verticalSpacingLarge,
          verticalSpacingLarge,
          const UploadButton()
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      title: Image.asset(ImageResources.appLogo, scale: 1.4),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ],
    );
  }

  Widget title() {
    return Text(
      'Verify your Identity',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
          ),
    );
  }

  Widget desc() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Text(
        'For you to post a listing, we require you to upload an identification document',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              letterSpacing: -0.4,
              height: 1.5,
            ),
      ),
    );
  }

  Widget label() {
    return Text(
      'Select Document type',
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(fontWeight: FontWeight.w500),
    );
  }
}
