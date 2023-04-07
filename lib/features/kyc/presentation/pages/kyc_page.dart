import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/features/kyc/presentation/pages/kyc_desktop_page.dart';
import 'package:paperless_app/features/kyc/presentation/pages/kyc_mobile_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../common/image_resources.dart';
import '../bloc/kyc_bloc.dart';

class KycPage extends StatefulWidget {
  const KycPage({super.key});

  @override
  createState() => _KycPage();
}

class _KycPage extends State<KycPage> {
  late KycBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<KycBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getValueForScreenType(
          context: context,
          mobile: appBar(),
          desktop: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
          )),
      body: ScreenTypeLayout.builder(
        breakpoints:
            const ScreenBreakpoints(desktop: 1000, tablet: 800, watch: 200),
        mobile: (context) => const KycMobilePage(),
        tablet: (context) => const KycMobilePage(),
        desktop: (context) => const KycDesktopPage(),
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
}
