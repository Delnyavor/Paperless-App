import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/common/app_themes.dart';
import 'package:paperless_app/features/gallery/domain/usecases/get_images.dart';
import 'package:paperless_app/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'package:paperless_app/features/kyc/domain/usecases/upload_usecase.dart';
import 'package:paperless_app/features/kyc/presentation/bloc/kyc_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'di/injection_container.dart';
import 'features/account/presentation/bloc/account_navigation_bloc.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/page_scaffolding/presentation/navigation_bloc/navigation_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initUploadFeature();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => AccountNavigationBloc(),
        ),
        BlocProvider<KycBloc>(
          create: (context) => KycBloc(
            uploadKyc: sl<UploadKYC>(),
          ),
        ),
        BlocProvider<GalleryBloc>(
          create: (context) => GalleryBloc(
            getImages: sl<GetImages>(),
          ),
        ),
      ],
      child: ResponsiveApp(
        preferDesktop: true,
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Paperless Listings',
            theme: appTheme,
            home: const LoginPage(),
          );
        },
      ),
    );
  }
}
