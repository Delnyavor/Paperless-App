import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paperless_app/features/kyc/presentation/bloc/kyc_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UploadWidget extends StatefulWidget {
  final String hint;
  final String iconPath;
  final bool front;
  const UploadWidget(
      {super.key,
      required this.hint,
      required this.iconPath,
      required this.front});

  @override
  State<UploadWidget> createState() => UploadWidgetState();
}

class UploadWidgetState extends State<UploadWidget> {
  File? imageData;

  late KycBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<KycBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: getValueForScreenType<BoxConstraints?>(
          context: context,
          mobile: null,
          tablet: null,
          desktop: const BoxConstraints(maxWidth: 300)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: getImage,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.48,
              decoration:
                  imageData == null ? defaultDecoration() : displayDecoration(),
              child: AspectRatio(
                aspectRatio: 1.2,
                child: child(),
              ),
            ),
          ),
          Positioned(
            top: -34,
            right: -32,
            child: cancelButton(),
          ),
        ],
      ),
    );
  }

  Widget cancelButton() {
    if (imageData == null) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          imageData = null;

          bloc.add(widget.front
              ? UpdateFrontImgEvent(file: imageData)
              : UpdateBackImgEvent(file: imageData));
        });
      },
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.pink,
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 12,
          ),
        ),
      ),
    );
  }

  BoxDecoration defaultDecoration() {
    return BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(12),
    );
  }

  BoxDecoration displayDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.11),
          offset: const Offset(6, 6),
          spreadRadius: -16,
          blurRadius: 10,
          blurStyle: BlurStyle.outer,
        )
      ],
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(image: FileImage(imageData!), fit: BoxFit.cover),
    );
  }

  Widget child() {
    if (imageData != null) {
      return const SizedBox.shrink();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  widget.iconPath,
                  scale: 3,
                ),
              ),
              // verticalSpacingLarge,
              Text(
                widget.hint,
                textAlign: TextAlign.center,
              )
            ]),
      );
    }
  }

  void getImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      imageData = File(imageFile.path);
      bloc.add(widget.front
          ? UpdateFrontImgEvent(file: imageData!)
          : UpdateBackImgEvent(file: imageData!));
    }
    setState(() {});
  }
}
