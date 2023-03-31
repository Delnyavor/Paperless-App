part of 'gallery_bloc.dart';

class GalleryState extends Equatable {
  const GalleryState({
    this.data = const [],
    this.status = GalleryStatus.empty,
  });

  final GalleryStatus status;
  final List<NetworkImageData> data;

  GalleryState copyWith({GalleryStatus? status, List<NetworkImageData>? data}) {
    return GalleryState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, data];
}

enum GalleryStatus { loading, failed, error, successful, empty }
