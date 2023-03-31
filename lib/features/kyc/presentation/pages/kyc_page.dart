import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/features/kyc/presentation/pages/kyc_mobile_page.dart';

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
    return const KycMobilePage();
  }
}
