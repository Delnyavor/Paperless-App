import 'package:equatable/equatable.dart';

class NetworkImageData extends Equatable {
  final String id;
  final String url;
  final int? width;
  final int? height;

  const NetworkImageData(
      {required this.id, required this.url, this.width, this.height});

  @override
  List<Object?> get props => [id, url];
}
