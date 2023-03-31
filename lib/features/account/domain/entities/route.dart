import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AccountPageRoute extends Equatable {
  final String name;
  final IconData icon;

  const AccountPageRoute({required this.name, required this.icon});

  @override
  List<Object?> get props => [name, icon];
}
