import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/spacers.dart';
import '../bloc/gallery_bloc.dart';

class GalleryBanner extends StatefulWidget {
  const GalleryBanner({super.key});

  @override
  State<GalleryBanner> createState() => _BannerState();
}

class _BannerState extends State<GalleryBanner> {
  late GalleryBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<GalleryBloc>(context);
    bloc.add(const GetImagesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://cdn2.thedogapi.com/images/S1V3Qeq4X_1280.jpg',
            ),
          ),
        ),
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.38)),
            ),
            Column(
              children: [
                appBar(),
                // verticalSpacingLarge,
                verticalSpacingMedium,
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Enjoy a healthy delicious meal',
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.allura(fontSize: 35, color: Colors.white),
                  ),
                ),
                verticalSpacingMin,
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    'We are an elegant restaurant with a vast range of African food from Cameroon, Nigeria, Kenya. Visit us and we promise you a very tasteful meal',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, height: 1.5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      title: const Text('La Brasserie'),
      automaticallyImplyLeading: false,
      // systemOverlayStyle: SystemUiOverlayStyle(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            backgroundColor: Colors.pink,
            child: Icon(
              Icons.phone,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            backgroundColor: Colors.pink,
            child: Icon(
              CupertinoIcons.chat_bubble_fill,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
