import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/common/spacers.dart';
import 'package:paperless_app/features/account/domain/entities/route.dart';
import '../../../kyc/presentation/pages/kyc_page.dart';
import '../bloc/account_navigation_bloc.dart';

class AccountNavButton extends StatefulWidget {
  final AccountPageRoute route;
  final int page;
  final void Function()? onPressed;
  const AccountNavButton({
    Key? key,
    required this.route,
    required this.page,
    this.onPressed,
  }) : super(key: key);

  @override
  State<AccountNavButton> createState() => _AccountNavButtonState();
}

class _AccountNavButtonState extends State<AccountNavButton>
    with SingleTickerProviderStateMixin {
  late AccountNavigationBloc bloc;
  bool active = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<AccountNavigationBloc>(context);
    activateRoute(bloc.state);
    deactivateRoute(bloc.state);
  }

  void setRoute() {
    bloc.add(AccountPageChanged(route: widget.page));
    Scaffold.of(context).closeDrawer();
    if (widget.route.name.toLowerCase() == "my listings") {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return const KycPage();
      }));
    }
  }

  void activateRoute(AccountNavigationState state) {
    if (state.page == widget.page && active == false) {
      setState(() {
        active = true;
      });
    }
  }

  void deactivateRoute(AccountNavigationState state) {
    if (state.page != widget.page && active == true) {
      setState(() {
        active = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: listener(),
    );
  }

  Widget listener() {
    return BlocListener<AccountNavigationBloc, AccountNavigationState>(
      listener: (context, state) {
        activateRoute(state);
        deactivateRoute(state);
      },
      child: textBody(),
    );
  }

  Widget textBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
      child: InkWell(
        onTap: setRoute,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.route.icon,
                color: active ? Colors.pink : Colors.grey[700],
                size: 28,
              ),
              horizontalSpacingTiny,
              Text(
                widget.route.name,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: active ? Colors.pink : Colors.grey[700],
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
