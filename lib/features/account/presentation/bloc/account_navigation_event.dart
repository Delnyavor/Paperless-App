part of 'account_navigation_bloc.dart';

abstract class AccountNavigationEvent extends Equatable {
  const AccountNavigationEvent();

  @override
  List<Object> get props => [];
}

class AccountPageChanged extends AccountNavigationEvent {
  const AccountPageChanged({
    required this.route,
  });

  final int route;

  @override
  List<Object> get props => [route];
}
