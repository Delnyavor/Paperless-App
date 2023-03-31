import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation_bloc/navigation_bloc.dart';

class PageScaffolding extends StatefulWidget {
  const PageScaffolding({super.key});

  @override
  createState() => _PageScaffolding();
}

class _PageScaffolding extends State<PageScaffolding> {
  late NavigationBloc bloc;
  List<Widget> pages = const [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<NavigationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }

  Widget builder() {
    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
      return IndexedStack(
        index: state.page,
        children: pages,
      );
    });
  }
}
