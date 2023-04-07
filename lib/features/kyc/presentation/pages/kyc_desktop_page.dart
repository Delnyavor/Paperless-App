import 'package:flutter/material.dart';
import 'package:paperless_app/common/spacers.dart';

import '../../../../common/image_resources.dart';
import '../../../../common/widgets/footer/footer.dart';
import '../../../page_scaffolding/presentation/widgets/global_navbar.dart';
import '../widgets/document_drop_down.dart';
import '../widgets/upload_button.dart';
import '../widgets/upload_widget.dart';

class KycDesktopPage extends StatefulWidget {
  const KycDesktopPage({super.key});

  @override
  State<KycDesktopPage> createState() => _KycDesktopPageState();
}

class _KycDesktopPageState extends State<KycDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              verticalSpacingLarge,
              verticalSpacingLarge,
              title(),
              verticalSpacingLarge,
              desc(),
              verticalSpacingLarge,
              label(),
              verticalSpacingTiny,
              const SizedBox(width: 450, child: DocTypeSelector()),
              verticalSpacingMedium,
              verticalSpacingMedium,
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  UploadWidget(
                    hint: 'Upload an image of the front',
                    iconPath: 'assets/icon_assets/id_front.png',
                    front: true,
                  ),
                  horizontalSpacingLarge,
                  UploadWidget(
                    hint: 'Upload an image of the back',
                    iconPath: 'assets/icon_assets/id_back.png',
                    front: false,
                  ),
                ],
              ),
              verticalSpacingLarge,
              verticalSpacingLarge,
              const UploadButton(),
              verticalSpacingLarge,
              verticalSpacingLarge,
            ],
          ),
        ),
        verticalSpacingLarge,
        verticalSpacingLarge,
        const Footer()
      ],
    );
  }

  Widget title() {
    return Text(
      'Verify your Identity',
      textAlign: TextAlign.start,
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

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImageResources.appLogo,
            scale: 1.1,
          ),
          const GlobalNavBar(),
        ],
      ),
    );
  }
}
