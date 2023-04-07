import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/features/gallery/presentation/pages/gallery.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../bloc/kyc_bloc.dart';

class UploadButton extends StatefulWidget {
  const UploadButton({super.key});

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  late KycBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<KycBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<KycBloc, KycState>(
      listener: (context, state) {
        bloc.add(const Reset());
        if (state.status == KYCPageStatus.successful) {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return const GalleryPage();
          }));
        }
      },
      child: TextButton(
        onPressed: () {
          bloc.add(const UploadKycEvent());
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          maximumSize: getValueForScreenType(
            context: context,
            mobile: const Size(1000, kMinInteractiveDimension),
            desktop: const Size(700, 80),
          ),
          minimumSize: getValueForScreenType(
            context: context,
            mobile: null,
            desktop: const Size(650, 50),
          ),
        ),
        child: child(),
      ),
    );
  }

  Widget child() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<KycBloc, KycState>(
        builder: (context, state) {
          if (state.status == KYCPageStatus.loading) {
            return const FittedBox(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return const Text(
            'Next',
            style: TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }
}
