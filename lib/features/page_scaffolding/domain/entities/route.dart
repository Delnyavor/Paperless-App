import 'package:equatable/equatable.dart';

class AppPageRoute extends Equatable {
  final String name;
  final bool button;

  const AppPageRoute({this.button = false, required this.name});

  @override
  List<Object?> get props => [name, button];
}
