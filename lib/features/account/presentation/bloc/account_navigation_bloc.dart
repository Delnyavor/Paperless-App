import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../domain/entities/route.dart';

part 'account_navigation_event.dart';
part 'account_navigation_state.dart';

class AccountNavigationBloc
    extends Bloc<AccountNavigationEvent, AccountNavigationState> {
  AccountNavigationBloc() : super(const AccountNavigationState()) {
    on<AccountPageChanged>(onPageChanged);
  }

  void onPageChanged(
      AccountPageChanged event, Emitter<AccountNavigationState> emit) {
    emit(state.copyWith(page: event.route));
  }
}
