// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/features/account/presentation/widgets/profile.dart';

import '../../../../common/spacers.dart';
import '../bloc/account_navigation_bloc.dart';
import 'account_nav_buttons.dart';

class SideNavigationRail extends StatelessWidget {
  const SideNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountNavigationBloc, AccountNavigationState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(alignment: Alignment.topCenter, child: Profile()),
              verticalSpacingSmall,
              ...state.pages.map(
                (e) => AccountNavButton(route: e, page: state.pages.indexOf(e)),
              ),
            ],
          ),
        );
      },
    );
  }
}
