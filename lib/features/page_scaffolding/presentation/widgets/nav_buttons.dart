import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/features/page_scaffolding/domain/entities/route.dart';
import 'package:paperless_app/features/page_scaffolding/presentation/navigation_bloc/navigation_bloc.dart';

class NavButton extends StatefulWidget {
  final AppPageRoute route;
  final int page;
  const NavButton({Key? key, required this.route, required this.page})
      : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton>
    with SingleTickerProviderStateMixin {
  late NavigationBloc bloc;
  bool active = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<NavigationBloc>(context);
    activateRoute(bloc.state);
    deactivateRoute(bloc.state);
  }

  void setRoute() {
    bloc.add(PageChanged(page: widget.page));
  }

  void activateRoute(NavigationState state) {
    if (state.page == widget.page && active == false) {
      setState(() {
        active = true;
      });
    }
  }

  void deactivateRoute(NavigationState state) {
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
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        activateRoute(state);
        deactivateRoute(state);
      },
      child: widget.route.button ? buttonBody() : textBody(),
    );
  }

  Widget textBody() {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: setRoute,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          widget.route.name,
          maxLines: 1,
          style: TextStyle(
              fontSize: 15,
              color: active ? Colors.pink : Colors.grey[700],
              letterSpacing: 0.4),
        ),
      ),
    );
  }

  Widget buttonBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: setRoute,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          foregroundColor: Colors.white,
          backgroundColor: Colors.pink,
        ),
        child: Text(
          widget.route.name,
          maxLines: 1,
          style: const TextStyle(color: Colors.white, letterSpacing: 0.4),
        ),
      ),
    );
  }
}
