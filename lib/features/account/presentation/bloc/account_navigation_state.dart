part of 'account_navigation_bloc.dart';

class AccountNavigationState extends Equatable {
  const AccountNavigationState({this.page = 0});

  final int page;
  final List<AccountPageRoute> pages = const [
    AccountPageRoute(icon: Icons.extension_outlined, name: 'Plugins'),
    AccountPageRoute(icon: Icons.dashboard_outlined, name: 'Dashboard'),
    AccountPageRoute(icon: LineIcons.user, name: 'Profile'),
    AccountPageRoute(icon: Icons.list_alt_outlined, name: 'My listings'),
    AccountPageRoute(icon: CupertinoIcons.heart, name: 'Favorites'),
  ];
  AccountNavigationState copyWith({
    int? page,
  }) {
    return AccountNavigationState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page, pages];
}
