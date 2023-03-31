part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  const NavigationState({this.page = 0});

  final int page;
  final List<AppPageRoute> pages = const [
    AppPageRoute(name: 'Home'),
    AppPageRoute(name: 'Explore'),
    AppPageRoute(name: 'Blog'),
    AppPageRoute(name: 'FAQ'),
    AppPageRoute(name: 'My Account'),
    AppPageRoute(name: '+ Add Listings', button: true),
  ];
  NavigationState copyWith({
    int? page,
  }) {
    return NavigationState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page, pages];
}
