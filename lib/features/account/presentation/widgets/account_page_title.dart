import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/features/page_scaffolding/presentation/navigation_bloc/navigation_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../bloc/account_navigation_bloc.dart';

class AccountPageBreadCrumbs extends StatefulWidget {
  const AccountPageBreadCrumbs({super.key});

  @override
  State<AccountPageBreadCrumbs> createState() => AccountPageBreadCrumbsState();
}

class AccountPageBreadCrumbsState extends State<AccountPageBreadCrumbs> {
  late NavigationBloc navigationBloc;
  late AccountNavigationBloc accountNavigationBloc;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (c) => desktopLayout(),
      mobile: (c) => mobileLayout(),
    );
  }

  Widget desktopLayout() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      color: Colors.pink.shade400,
      child: Row(
        children: [
          sublistener(),
        ],
      ),
    );
  }

  Widget mobileLayout() {
    return Row(
      children: [
        mainlistener(),
        const Icon(Icons.chevron_right),
        sublistener(),
      ],
    );
  }

  Widget mainlistener() {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) => textDisplay(
        state.pages[state.page].name,
      ),
    );
  }

  Widget sublistener() {
    return BlocBuilder<AccountNavigationBloc, AccountNavigationState>(
      builder: (context, state) => textDisplay(
        state.pages[state.page].name,
      ),
    );
  }

  Widget textDisplay(String text) {
    var desktop = Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(color: Colors.white, fontWeight: FontWeight.w600);

    var mobile = Theme.of(context).textTheme.bodyMedium;

    return Text(
      text,
      style: getValueForScreenType(
          context: context, mobile: mobile, desktop: desktop),
    );
  }
}
