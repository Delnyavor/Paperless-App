import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/features/account/presentation/pages/plugin_page.dart';

import '../bloc/account_navigation_bloc.dart';
import '../widgets/empty_page.dart';

class AccountPageHandler extends StatefulWidget {
  const AccountPageHandler({super.key});

  @override
  createState() => _AccountPageHandler();
}

class _AccountPageHandler extends State<AccountPageHandler> {
  late AccountNavigationBloc bloc;
  List<Widget> pages = const [
    PluginPage(),
    EmptyPage(),
    EmptyPage(),
    EmptyPage(),
    EmptyPage(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<AccountNavigationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountNavigationBloc, AccountNavigationState>(
        builder: (context, state) {
      return IndexedStack(
        index: state.page,
        children: pages,
      );
    });
  }
}
