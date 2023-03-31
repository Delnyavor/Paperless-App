import 'dart:io';

import 'package:equatable/equatable.dart';

class Identifier extends Equatable {
  final File front;
  final File back;
  final DocumentType type;

  const Identifier(
      {required this.front, required this.back, required this.type});

  @override
  List<Object?> get props => [front, back, type];
}

enum DocumentType { id, passport, license }
