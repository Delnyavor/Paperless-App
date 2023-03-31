import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/features/page_scaffolding/presentation/widgets/nav_buttons.dart';

import '../navigation_bloc/navigation_bloc.dart';

class GlobalNavBar extends StatefulWidget {
  const GlobalNavBar({Key? key}) : super(key: key);

  @override
  State<GlobalNavBar> createState() => _GlobalNavBarState();
}

class _GlobalNavBarState extends State<GlobalNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: state.pages
                .map(
                  (e) => NavButton(route: e, page: state.pages.indexOf(e)),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
